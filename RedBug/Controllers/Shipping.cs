using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Shipping : Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
    }
}