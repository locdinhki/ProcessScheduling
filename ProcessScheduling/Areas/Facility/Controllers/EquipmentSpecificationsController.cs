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
    public class EquipmentSpecificationsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/EquipmentSpecifications
        public ActionResult Index()
        {
            return View(db.EquipmentSpecifications.ToList());
        }

        // GET: Facility/EquipmentSpecifications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentSpecification equipmentSpecification = db.EquipmentSpecifications.Find(id);
            if (equipmentSpecification == null)
            {
                return HttpNotFound();
            }
            return View(equipmentSpecification);
        }

        // GET: Facility/EquipmentSpecifications/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Facility/EquipmentSpecifications/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Type,Value")] EquipmentSpecification equipmentSpecification)
        {
            if (ModelState.IsValid)
            {
                db.EquipmentSpecifications.Add(equipmentSpecification);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(equipmentSpecification);
        }

        // GET: Facility/EquipmentSpecifications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentSpecification equipmentSpecification = db.EquipmentSpecifications.Find(id);
            if (equipmentSpecification == null)
            {
                return HttpNotFound();
            }
            return View(equipmentSpecification);
        }

        // POST: Facility/EquipmentSpecifications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Type,Value")] EquipmentSpecification equipmentSpecification)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipmentSpecification).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(equipmentSpecification);
        }

        // GET: Facility/EquipmentSpecifications/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentSpecification equipmentSpecification = db.EquipmentSpecifications.Find(id);
            if (equipmentSpecification == null)
            {
                return HttpNotFound();
            }
            return View(equipmentSpecification);
        }

        // POST: Facility/EquipmentSpecifications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EquipmentSpecification equipmentSpecification = db.EquipmentSpecifications.Find(id);
            db.EquipmentSpecifications.Remove(equipmentSpecification);
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
