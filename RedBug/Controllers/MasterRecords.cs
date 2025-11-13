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

        public IActionResult Vendors(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new Vendors();
            model.partialView = "Vendors/Vendors";
            model.partialModel = pModel;
            model.partialVendors = pModel;

            //send back the view
            return View("Index", model);
        }
        
        [HttpPost]
        public IActionResult SaveVendor(Vendors model, IFormCollection collection)
        {
            try
            {
                var mrModel = new Models.MasterRecords.MasterRecords();
                
                if (ModelState.IsValid == false)
                {
                    //lets save the data in the model to the database
                    mrModel.partialView = "Vendors/Vendors";
                    mrModel.partialModel = model;
                    mrModel.partialVendors = model;
                    
                    return View("Index", mrModel);
                }
                else
                {
                    //lets save the data from the page to the database
                    
                    
                    //now it's time to go back to the beginning of the Vendor page
                    
                    var pModel = new Vendors();
                    mrModel.partialView = "Vendors/Vendors";
                    mrModel.partialModel = pModel;
                    mrModel.partialVendors = pModel;
                    
                    //send back the view
                    return RedirectToAction("Index", "MasterRecords", mrModel);    
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        
        [HttpPost]
        public IActionResult Vendors(Models.MasterRecords.MasterRecords model, int id)
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
        
        public IActionResult VendorAddresses(Models.MasterRecords.MasterRecords model)
        {
            var pModel = new VendorAddress();
            model.partialView = "Vendors/Addresses";
            model.partialModel = pModel;
            model.partialVendorAddresses = pModel;

            //send back the view
            return View("Index", model);
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