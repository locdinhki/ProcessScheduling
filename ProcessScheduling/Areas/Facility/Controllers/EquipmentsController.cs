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
    public class EquipmentsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/Equipments
        public ActionResult Index()
        {
            var equipments = db.Equipments.Include(e => e.WorkStation);
            return View(equipments.ToList());
        }

        // GET: Facility/Equipments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment equipment = db.Equipments.Find(id);
            if (equipment == null)
            {
                return HttpNotFound();
            }
            ViewBag.equipmentcategories = equipment.EquipmentCategories;
            ViewBag.equipmentspecifications = equipment.EquipmentSpecifications;

            return View(equipment);
        }

        // GET: Facility/Equipments/Create
        public ActionResult Create()
        {
            ViewBag.WorkStationId = new SelectList(db.WorkStations, "Id", "Name");
            return View();
        }

        // POST: Facility/Equipments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Code,Name,Description,ProductionRunTime,ProductionCapacity,RunCapacity,FirstPassYield,ChangeOrderTime,ProductionLine,DownTime,OperatorCount,WorkStationId")] Equipment equipment)
        {
            if (ModelState.IsValid)
            {
                db.Equipments.Add(equipment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.WorkStationId = new SelectList(db.WorkStations, "Id", "Name", equipment.WorkStationId);
            return View(equipment);
        }

        // GET: Facility/Equipments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment equipment = db.Equipments.Find(id);
            if (equipment == null)
            {
                return HttpNotFound();
            }
            ViewBag.WorkStationId = new SelectList(db.WorkStations, "Id", "Name", equipment.WorkStationId);
            return View(equipment);
        }

        // POST: Facility/Equipments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Code,Name,Description,CycleTime,ProductionRunTime,ProductionCapacity,RunCapacity,FirstPassYield,ChangeOrderTime,ProductionLine,DownTime,WorkStationId")] Equipment equipment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.WorkStationId = new SelectList(db.WorkStations, "Id", "Name", equipment.WorkStationId);
            return View(equipment);
        }

        // GET: Facility/Equipments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment equipment = db.Equipments.Find(id);
            if (equipment == null)
            {
                return HttpNotFound();
            }
            return View(equipment);
        }

        // POST: Facility/Equipments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Equipment equipment = db.Equipments.Find(id);
            db.Equipments.Remove(equipment);
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
