using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProcessScheduling.Models;

namespace ProcessScheduling.Controllers
{
    public class PlanProductsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: PlanProducts
        public ActionResult Index()
        {
            var planProducts = db.PlanProducts.Include(p => p.Plan);
            return View(planProducts.ToList());
        }

        // GET: PlanProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanProduct planProduct = db.PlanProducts.Find(id);
            if (planProduct == null)
            {
                return HttpNotFound();
            }
            Product product = planProduct.Product;
            
            List<Part> productParts = product.Parts.ToList();
            //List<Part> parts = db.Parts.ToList();
            //ViewBag.product = product;
            ViewBag.productParts = productParts;
            //ViewBag.parts = parts;

            return View(planProduct);
        }

        // GET: PlanProducts/Create
        public ActionResult Create()
        {
            ViewBag.PlanId = new SelectList(db.Plans, "Id", "Name");
            ViewBag.ProductId = new SelectList(db.Products, "Id", "Code");
            return View();
        }

        // POST: PlanProducts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,PlanId,ProductId,TargetNumber")] PlanProduct planProduct)
        {
            if (ModelState.IsValid)
            {
                db.PlanProducts.Add(planProduct);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PlanId = new SelectList(db.Plans, "Id", "Name", planProduct.PlanId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "Code", planProduct.ProductId);
            return View(planProduct);
        }

        // GET: PlanProducts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanProduct planProduct = db.PlanProducts.Find(id);
            if (planProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.PlanId = new SelectList(db.Plans, "Id", "Name", planProduct.PlanId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "Code", planProduct.ProductId);
            return View(planProduct);
        }

        // POST: PlanProducts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,PlanId,ProductId,TargetNumber")] PlanProduct planProduct)
        {
            if (ModelState.IsValid)
            {
                db.Entry(planProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PlanId = new SelectList(db.Plans, "Id", "Name", planProduct.PlanId);
            ViewBag.ProductId = new SelectList(db.Products, "Id", "Code", planProduct.ProductId);

            return View(planProduct);
        }

        // GET: PlanProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanProduct planProduct = db.PlanProducts.Find(id);
            if (planProduct == null)
            {
                return HttpNotFound();
            }
            return View(planProduct);
        }

        // POST: PlanProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PlanProduct planProduct = db.PlanProducts.Find(id);
            db.PlanProducts.Remove(planProduct);
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
