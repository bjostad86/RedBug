using Microsoft.AspNetCore.Mvc;
using RedBug.Models.MasterRecords;

namespace RedBug.Controllers
{
    public class MasterRecords : Controller
    {
        public IActionResult Index()
        {
            var model = new MasterRecordsModel
            {
                partialView = ""
            };

            return View(model);
        }

        public IActionResult Vendors(MasterRecordsModel model)
        {
            model.partialView = "Vendors/Vendors";
            model.partialVendors = new VendorMaster();

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult VendorAddresses(MasterRecordsModel model)
        {
            model.partialView = "Vendors/Addresses";
            model.partialVendorAddresses = new VendorAddress();

            //send back the view
            return View("Index", model);
        }
        
        [HttpPost]
        public IActionResult Vendors(MasterRecordsModel model, int id)
        {
            model.partialView = "Vendors/Vendors";
            model.partialVendors = new VendorMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Lots(MasterRecordsModel model)
        {
            model.partialView = "Inventory/Lots";
            model.partialLots = new LotMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Customers(MasterRecordsModel model)
        {
            model.partialView = "Customers/Customers";
            model.partialCustomers = new CustomerMaster();

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult CustomerAddresses(MasterRecordsModel model)
        {
            model.partialView = "Customers/Addresses";
            model.partialCustomers = new CustomerMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Items(MasterRecordsModel model)
        {
            model.partialView = "Inventory/Items";
            model.partialItems = new ItemMaster();

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult ItemStructure(MasterRecordsModel model)
        {
            model.partialView = "Inventory/ItemStructure";
            model.partialItemStuctures = new ItemStructureMaster();

            //send back the view
            return View("Index", model);
        }
    }
}