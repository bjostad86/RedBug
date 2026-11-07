using Microsoft.AspNetCore.Mvc;
using model = Common.Models.MasterRecords;

namespace RedBug.Controllers
{
    public class MasterRecords : Controller
    {
        public IActionResult Index()
        {
            var model = new model.MasterRecords
            {
                partialView = "",
                partialModel = null
            };

            return View(model);
        }
        
        public IActionResult Lots(model.MasterRecords model)
        {
            var pModel = new model.Lots();
            model.partialView = "Inventory/Lots";
            model.partialModel = pModel;
            model.partialLots = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Customers(model.MasterRecords model)
        {
            var pModel = new model.Customer();
            model.partialView = "Customers/Customers";
            model.partialModel = pModel;
            model.partialCustomer = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult CustomerAddresses(model.MasterRecords model)
        {
            var pModel = new model.Customer();
            model.partialView = "Customers/Addresses";
            model.partialModel = pModel;
            model.partialCustomer = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Items(model.MasterRecords model)
        {
            var pModel = new model.Items();
            model.partialView = "Inventory/Items";
            model.partialModel = pModel;
            model.partialItems = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult ItemStructure(model.MasterRecords model)
        {
            var pModel = new model.ItemStructures();
            model.partialView = "Inventory/ItemStructure";
            model.partialModel = pModel;
            model.partialItemStuctures = pModel;

            //send back the view
            return View("Index", model);
        }
    }
}