using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class MenusController : Controller
    {
        public IActionResult Accounting()
        {
            return View();
        }
        
        public IActionResult MasterRecords()
        {
            return RedirectToAction("Index", "MasterRecords");
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
        
        public IActionResult Warehouse()
        {
            return View();
        }
        
        public IActionResult Index()
        {
            return View();
        }
    }

}