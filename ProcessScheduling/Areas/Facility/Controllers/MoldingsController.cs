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
    public class MoldingsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Facility/Moldings
        public ActionResult Index()
        {
            var moldings = db.Moldings.Include(m => m.Part);
            return View(moldings.ToList());
        }

        // GET: Facility/Moldings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Molding molding = db.Moldings.Find(id);
            if (molding == null)
            {
                return HttpNotFound();
            }

            List<Equipment> equipments = new List<Equipment>();
            foreach(EquipmentCategory equipmentCategory in molding.EquipmentCategories)
            {
                equipments.AddRange(equipmentCategory.Equipments);
            }
            ViewBag.equipments = equipments;
            ViewBag.equipmentcategories = molding.EquipmentCategories;
            ViewBag.equipmentspecifications = molding.EquipmentSpecifications;


            return View(molding);
        }

        // GET: Facility/Moldings/Create
        public ActionResult Create()
        {
            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code");
            return View();
        }

        // POST: Facility/Moldings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,PartId,Code,Name,Desciption")] Molding molding)
        {
            if (ModelState.IsValid)
            {
                db.Moldings.Add(molding);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code", molding.PartId);
            return View(molding);
        }

        // GET: Facility/Moldings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Molding molding = db.Moldings.Find(id);
            if (molding == null)
            {
                return HttpNotFound();
            }
            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code", molding.PartId);
            return View(molding);
        }

        // POST: Facility/Moldings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,PartId,Code,Name,Desciption")] Molding molding)
        {
            if (ModelState.IsValid)
            {
                db.Entry(molding).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code", molding.PartId);
            return View(molding);
        }

        // GET: Facility/Moldings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Molding molding = db.Moldings.Find(id);
            if (molding == null)
            {
                return HttpNotFound();
            }
            return View(molding);
        }

        // POST: Facility/Moldings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Molding molding = db.Moldings.Find(id);
            db.Moldings.Remove(molding);
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
