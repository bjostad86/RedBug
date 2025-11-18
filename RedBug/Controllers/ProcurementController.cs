using Microsoft.AspNetCore.Mvc;
using RedBug.Models.Procurement;

namespace RedBug.Controllers
{
    public class ProcurementController : Controller
    {
        // GET
        public IActionResult Index()
        {
            var model = new Models.Procurement.Structures()
            {
                partialView = "",
                partialModel = null
            };

            return View(model);
        }
        
        public IActionResult Orders(Models.Procurement.Structures model)
        {
            var pModel = new Vendors();
            model.partialView = "Orders/Orders";
            model.partialModel = pModel;
            model.partialVendors = pModel;

            //send back the view
            return View("Index", model);
        }
        
        public IActionResult Vendors(Models.Procurement.Structures model)
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
                var mrModel = new Models.Procurement.Structures();
                
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
                    return RedirectToAction("Index", "Procurement", mrModel);    
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
        
        [HttpPost]
        public IActionResult Vendors(Models.Procurement.Structures model, int id)
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
        
        public IActionResult VendorAddresses(Models.Procurement.Structures model)
        {
            var pModel = new VendorAddress();
            model.partialView = "Vendors/Addresses";
            model.partialModel = pModel;
            model.partialVendorAddresses = pModel;

            //send back the view
            return View("Index", model);
        }
        
        
    }
}