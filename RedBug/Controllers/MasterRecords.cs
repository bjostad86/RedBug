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
                partialView = "",
                partialModel = null
            };

            return View(model);
        }

        public IActionResult Vendors(MasterRecordsModel model)
        {
            var pModel = new VendorMaster();
            model.partialView = "Vendors/Vendors";
            model.partialModel = pModel;
            model.partialVendors = pModel;

            //send back the view
            return View("Index", model);
        }
        
        [HttpPost]
        public IActionResult SaveVendor(MasterRecordsModel model, FormCollection collection)
        {
            try
            {
                //lets save the data in the model to the database
                
                
                
                //send back the view
                return View("Index", model);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        
        [HttpPost]
        public IActionResult Vendors(MasterRecordsModel model, int id)
        {
            try
            {
                //load the model data from the database for the id passed
                
                //send back the view
                return View("Index", model);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        
        public IActionResult VendorAddresses(MasterRecordsModel model)
        {
            var pModel = new VendorAddress();
            model.partialView = "Vendors/Addresses";
            model.partialModel = pModel;
            model.partialVendorAddresses = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult Lots(MasterRecordsModel model)
        {
            var pModel = new LotMaster();
            model.partialView = "Inventory/Lots";
            model.partialModel = pModel;
            model.partialLots = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Customers(MasterRecordsModel model)
        {
            var pModel = new CustomerMaster();
            model.partialView = "Customers/Customers";
            model.partialModel = pModel;
            model.partialCustomers = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult CustomerAddresses(MasterRecordsModel model)
        {
            var pModel = new CustomerMaster();
            model.partialView = "Customers/Addresses";
            model.partialModel = pModel;
            model.partialCustomers = pModel;

            //send back the view
            return View("Index", model);
        }

        public IActionResult Items(MasterRecordsModel model)
        {
            var pModel = new ItemMaster();
            model.partialView = "Inventory/Items";
            model.partialModel = pModel;
            model.partialItems = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult ItemStructure(MasterRecordsModel model)
        {
            var pModel = new ItemStructureMaster();
            model.partialView = "Inventory/ItemStructure";
            model.partialModel = pModel;
            model.partialItemStuctures = pModel;

            //send back the view
            return View("Index", model);
        }
    }
}