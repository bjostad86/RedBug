using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Security : Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
    }
}