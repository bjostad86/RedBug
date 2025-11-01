using Microsoft.AspNetCore.Mvc;

namespace RedBug.Controllers;

public class MasterRecords : Controller
{
    // GET
    public IActionResult Index()
    {
        return View();
    }
    
    public IActionResult Vendors()
    {
        // You can pass a model to the partial view if needed
        // return PartialView("_MyPartialView", myModel);
        return PartialView("Vendors");
    }
}