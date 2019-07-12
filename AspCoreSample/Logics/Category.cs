using AspCoreSample.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspCoreSample.Logics
{
    public class Category 
    {
        private  Restaurant_DBContext _context = new Restaurant_DBContext();
        public async Task<List<MenuCategory>> getAllcategories()
        {
            return await _context.MenuCategory.ToListAsync();
        }
        public async Task<MenuCategory> getcategorybyid(int id)
        {
            return await _context.MenuCategory.FindAsync(id);
        }
        public async Task<bool> deletecategory(int id)
        {
            var record = await getcategorybyid(id);
           _context.MenuCategory.Remove(record);
            var stauss = await  _context.SaveChangesAsync();
            if (stauss > 0)
                return true;
            else
                return false;
        }

        public async Task<int> AddEditRecord(MenuCategory Category)
        {
            if(Category.Menucategoryid > 0)
            {
                var editcategory = await getcategorybyid(Category.Menucategoryid);
                editcategory.Menucategoryname = Category.Menucategoryname;
                await  _context.SaveChangesAsync();
                return editcategory.Menucategoryid;
            }
            else
            {
                _context.Add(Category);
                await _context.SaveChangesAsync();
                return Category.Menucategoryid;

            }
        }
    }
}
