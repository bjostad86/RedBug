using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Menus : Controller
    {
        public IActionResult Billing()
        {
            return View();
        }
        
        public IActionResult AccountsPayable()
        {
            return View();
        }
        
        public IActionResult Manufacturing()
        {
            return View();
        }
        
        public IActionResult Production()
        {
            return View();
        }
        
        public IActionResult Shipping()
        {
            return View();
        }
        
        public IActionResult Reports()
        {
            return View();
        }
        
        public IActionResult PurchasingProcurement()
        {
            return View();
        }
    }

}