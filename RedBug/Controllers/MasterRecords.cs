using Microsoft.AspNetCore.Mvc;
using RedBug.Models.MasterRecords;

namespace RedBug.Controllers
{
    public class MasterRecords : Controller
    {
        public IActionResult Index()
        {
            var model = new Models.MasterRecords.MasterRecords
            {
                partialView = "",
                partialModel = null
            };

            return View(model);
        }
        
        public IActionResult Lots(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new Lots();
            model.partialView = "Inventory/Lots";
            model.partialModel = pModel;
            model.partialLots = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Customers(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new Customers();
            model.partialView = "Customers/Customers";
            model.partialModel = pModel;
            model.partialCustomers = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult CustomerAddresses(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new Customers();
            model.partialView = "Customers/Addresses";
            model.partialModel = pModel;
            model.partialCustomers = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Items(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new Items();
            model.partialView = "Inventory/Items";
            model.partialModel = pModel;
            model.partialItems = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult ItemStructure(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new ItemStructures();
            model.partialView = "Inventory/ItemStructure";
            model.partialModel = pModel;
            model.partialItemStuctures = pModel;

            //send back the view
            return View("Index", model);
        }
    }
}