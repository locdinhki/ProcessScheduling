using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using ProcessScheduling.Models;

namespace ProcessScheduling.Areas.Product.Controllers
{
    public class ProductsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Item/Products
        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        // GET: Item/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.product = product;
            ViewBag.productParts = product.Parts.ToList();
            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code");

            return View(ViewBag);
        }

        // GET: Item/Products/Details/5
        [HttpPost]
        public ActionResult Details(int id, [Bind(Include = "PartId")] int partId)
        {
            Models.Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            Part part = db.Parts.Find(partId);
            if (part != null)
            {
                product.Parts.Add(part);
                db.SaveChanges();
            }
            ViewBag.product = product;
            ViewBag.productParts = product.Parts.ToList();
            ViewBag.PartId = new SelectList(db.Parts, "Id", "Code");

            return View(ViewBag);
        }

        // GET: Item/Products/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Item/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Code,Name,Description")] Models.Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        // GET: Item/Products/Details/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPart(int id, string Code, string Name, string Description)
        {
            Part part = new Part
            {
                Code = Code,
                Name = Name,
                Description = Description
            };

            Models.Product product = db.Products.Find(id);

            db.Parts.Add(part);

            product.Parts.Add(part);
            db.SaveChanges();

            return View(product);
        }

        // GET: Item/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Item/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Code,Name,Description")] Models.Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Item/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Item/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Models.Product product = db.Products.Find(id);
            db.Products.Remove(product);
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
