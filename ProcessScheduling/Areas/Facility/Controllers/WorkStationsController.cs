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
    public class WorkStationsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/WorkStations
        public ActionResult Index()
        {
            var workStations = db.WorkStations.Include(w => w.Line);
            return View(workStations.ToList());
        }

        // GET: Facility/WorkStations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStation workStation = db.WorkStations.Find(id);
            if (workStation == null)
            {
                return HttpNotFound();
            }
            ViewBag.equipments = workStation.Equipments.ToList();

            return View(workStation);
        }

        // GET: Facility/WorkStations/Create
        public ActionResult Create()
        {
            ViewBag.LineId = new SelectList(db.Lines, "Id", "Name");
            ViewBag.WorkStationTypeId = new SelectList(db.WorkStationTypes, "Id", "Name");
            return View();
        }

        // POST: Facility/WorkStations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,LineId,WorkStationTypeId")] WorkStation workStation)
        {
            if (ModelState.IsValid)
            {
                db.WorkStations.Add(workStation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.LineId = new SelectList(db.Lines, "Id", "Name", workStation.LineId);

            return View(workStation);
        }

        // GET: Facility/WorkStations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStation workStation = db.WorkStations.Find(id);
            if (workStation == null)
            {
                return HttpNotFound();
            }
            ViewBag.LineId = new SelectList(db.Lines, "Id", "Name", workStation.LineId);
            ViewBag.WorkStationTypeId = new SelectList(db.WorkStationTypes, "Id", "Name", workStation.WorkStationTypeId);
            return View(workStation);
        }

        // POST: Facility/WorkStations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,LineId,WorkStationTypeId,PhaseNumber")] WorkStation workStation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workStation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LineId = new SelectList(db.Lines, "Id", "Name", workStation.LineId);
            ViewBag.WorkStationTypeId = new SelectList(db.WorkStationTypes, "Id", "Name", workStation.WorkStationTypeId);
            return View(workStation);
        }

        // GET: Facility/WorkStations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkStation workStation = db.WorkStations.Find(id);
            if (workStation == null)
            {
                return HttpNotFound();
            }
            return View(workStation);
        }

        // POST: Facility/WorkStations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkStation workStation = db.WorkStations.Find(id);
            db.WorkStations.Remove(workStation);
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
