using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Menus : Controller
    {
        public IActionResult Accounting()
        {
            return View();
        }
        
        public IActionResult Orders()
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
        
        public IActionResult PlanningForecasting()
        {
            return View();
        }
        
        public IActionResult Security()
        {
            return View();
        }
        
        public IActionResult Edi()
        {
            return View();
        }
    }

}