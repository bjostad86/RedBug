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
        return View();
    }
}