using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using AspCoreSample.Models;
using AspCoreSample.Logics;

namespace AspCoreSample.Controllers
{
    public class MenuCategoriesController : Controller
    {
        Category allcategory = new Category();
        private readonly Restaurant_DBContext _context;

        public MenuCategoriesController(Restaurant_DBContext context)
        {
            _context = context;
        }

        // GET: MenuCategories
        public async Task<IActionResult> Index()
        {
            return View(await allcategory.getAllcategories());
        }

        // GET: MenuCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var menuCategory = await allcategory.getcategorybyid(id.Value);
            if (menuCategory == null)
            {
                return NotFound();
            }

            return View(menuCategory);
        }

        // GET: MenuCategories/Create
        public async Task<IActionResult> Create(int? id)
        {
            if(id != null)
           {
               var record = await allcategory.getcategorybyid(id.Value);
               return View(record);

            }
            else
            {
                return View();
            }
  
        }

        // POST: MenuCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MenuCategory menuCategory)
        {
            if (ModelState.IsValid)
            {
                await allcategory.AddEditRecord(menuCategory);
                return RedirectToAction(nameof(Index));
            }
            return View(menuCategory);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var menuCategory = await _context.MenuCategory
                .FirstOrDefaultAsync(m => m.Menucategoryid == id);
            if (menuCategory == null)
            {
                return NotFound();
            }

            return View(menuCategory);
        }

        // POST: MenuCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await allcategory.deletecategory(id);
            return RedirectToAction(nameof(Index));
        }

        private bool MenuCategoryExists(int id)
        {
            return _context.MenuCategory.Any(e => e.Menucategoryid == id);
        }
    }
}
