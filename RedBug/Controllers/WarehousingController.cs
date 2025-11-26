using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers;

public class WarehousingController : Controller
{
    // GET
    public IActionResult Index()
    {
        var model = new Models.Warehousing.Main()
        {
            partialView = "",
            partialModel = null
        };

        return View(model);
    }
}