using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Accounting : Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
        
    }
}