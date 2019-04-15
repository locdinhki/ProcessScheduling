using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProcessScheduling.Models;

namespace ProcessScheduling.Areas.Facility.Controllers
{
    public class WorkStationTypesController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/WorkStationTypes
        public ActionResult Index()
        {
            return View(db.WorkStationTypes.ToList());
        }

        // GET: Facility/WorkStationTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStationType workStationType = db.WorkStationTypes.Find(id);
            if (workStationType == null)
            {
                return HttpNotFound();
            }
            return View(workStationType);
        }

        // GET: Facility/WorkStationTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Facility/WorkStationTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description")] WorkStationType workStationType)
        {
            if (ModelState.IsValid)
            {
                db.WorkStationTypes.Add(workStationType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(workStationType);
        }

        // GET: Facility/WorkStationTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStationType workStationType = db.WorkStationTypes.Find(id);
            if (workStationType == null)
            {
                return HttpNotFound();
            }
            return View(workStationType);
        }

        // POST: Facility/WorkStationTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description")] WorkStationType workStationType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workStationType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(workStationType);
        }

        // GET: Facility/WorkStationTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStationType workStationType = db.WorkStationTypes.Find(id);
            if (workStationType == null)
            {
                return HttpNotFound();
            }
            return View(workStationType);
        }

        // POST: Facility/WorkStationTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkStationType workStationType = db.WorkStationTypes.Find(id);
            db.WorkStationTypes.Remove(workStationType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
