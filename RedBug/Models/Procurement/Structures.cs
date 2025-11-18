namespace RedBug.Models.Procurement;

public class Structures
{
    public string partialView { get; set; }
    public object partialModel { get; set; }
        
    //child models
    public Vendors partialVendors { get; set; }
    public VendorAddress partialVendorAddresses { get; set; }
}