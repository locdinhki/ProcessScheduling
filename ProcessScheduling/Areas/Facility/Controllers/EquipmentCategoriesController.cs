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
    public class EquipmentCategoriesController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/EquipmentCategories
        public ActionResult Index()
        {
            return View(db.EquipmentCategories.ToList());
        }

        // GET: Facility/EquipmentCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentCategory equipmentCategory = db.EquipmentCategories.Find(id);
            if (equipmentCategory == null)
            {
                return HttpNotFound();
            }
            return View(equipmentCategory);
        }

        // GET: Facility/EquipmentCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Facility/EquipmentCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Code,Description")] EquipmentCategory equipmentCategory)
        {
            if (ModelState.IsValid)
            {
                db.EquipmentCategories.Add(equipmentCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(equipmentCategory);
        }

        // GET: Facility/EquipmentCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentCategory equipmentCategory = db.EquipmentCategories.Find(id);
            if (equipmentCategory == null)
            {
                return HttpNotFound();
            }
            return View(equipmentCategory);
        }

        // POST: Facility/EquipmentCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Code,Description")] EquipmentCategory equipmentCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipmentCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(equipmentCategory);
        }

        // GET: Facility/EquipmentCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EquipmentCategory equipmentCategory = db.EquipmentCategories.Find(id);
            if (equipmentCategory == null)
            {
                return HttpNotFound();
            }
            return View(equipmentCategory);
        }

        // POST: Facility/EquipmentCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EquipmentCategory equipmentCategory = db.EquipmentCategories.Find(id);
            db.EquipmentCategories.Remove(equipmentCategory);
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
