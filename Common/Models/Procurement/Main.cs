namespace Common.Models.Procurement
{
    public class Main
    {
        public string partialView { get; set; }
        public object partialModel { get; set; }
        
        //child models
        public PurchaseOrders partialPurchaseOrders { get; set; }
        public Vendors partialVendors { get; set; }
        public VendorTypes partialVendorTypes { get; set; }
        public VendorAddress partialVendorAddresses { get; set; }
    }
}