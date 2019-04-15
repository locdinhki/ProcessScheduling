using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProcessScheduling.Models;

namespace ProcessScheduling.Areas.Customer.Controllers
{
    public class CompanyContactsController : Controller
    {
        private SupplyEntities db = new SupplyEntities();

        // GET: Customer/CompanyContacts
        public ActionResult Index()
        {
            var companyContacts = db.CompanyContacts.Include(c => c.Company);
            return View(companyContacts.ToList());
        }

        // GET: Customer/CompanyContacts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyContact companyContact = db.CompanyContacts.Find(id);
            if (companyContact == null)
            {
                return HttpNotFound();
            }
            return View(companyContact);
        }

        // GET: Customer/CompanyContacts/Create
        public ActionResult Create()
        {
            ViewBag.CompanyId = new SelectList(db.Companies, "Id", "Name");
            return View();
        }

        // POST: Customer/CompanyContacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Phone,Email,Fax,CompanyId")] CompanyContact companyContact)
        {
            if (ModelState.IsValid)
            {
                db.CompanyContacts.Add(companyContact);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CompanyId = new SelectList(db.Companies, "Id", "Name", companyContact.CompanyId);
            return View(companyContact);
        }

        // GET: Customer/CompanyContacts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyContact companyContact = db.CompanyContacts.Find(id);
            if (companyContact == null)
            {
                return HttpNotFound();
            }
            ViewBag.CompanyId = new SelectList(db.Companies, "Id", "Name", companyContact.CompanyId);
            return View(companyContact);
        }

        // POST: Customer/CompanyContacts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Phone,Email,Fax,CompanyId")] CompanyContact companyContact)
        {
            if (ModelState.IsValid)
            {
                db.Entry(companyContact).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CompanyId = new SelectList(db.Companies, "Id", "Name", companyContact.CompanyId);
            return View(companyContact);
        }

        // GET: Customer/CompanyContacts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyContact companyContact = db.CompanyContacts.Find(id);
            if (companyContact == null)
            {
                return HttpNotFound();
            }
            return View(companyContact);
        }

        // POST: Customer/CompanyContacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CompanyContact companyContact = db.CompanyContacts.Find(id);
            db.CompanyContacts.Remove(companyContact);
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
