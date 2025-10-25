using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers
{
    public class Controls : Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
    }
}