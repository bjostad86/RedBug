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
            model.partialView = "Vendors";
            model.partialVendors = new VendorMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Lots(MasterRecordsModel model)
        {
            model.partialView = "Lots";
            model.partialLots = new LotMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Customers(MasterRecordsModel model)
        {
            model.partialView = "Customers";
            model.partialCustomers = new CustomerMaster();

            //send back the view
            return View("Index", model);
        }

        public IActionResult Items(MasterRecordsModel model)
        {
            model.partialView = "Items";
            model.partialItems = new ItemMaster();

            //send back the view
            return View("Index", model);
        }
    }
}