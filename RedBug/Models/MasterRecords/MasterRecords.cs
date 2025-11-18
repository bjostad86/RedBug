namespace RedBug.Models.MasterRecords
{
    public class MasterRecords
    {
        public string partialView { get; set; }
        public object partialModel { get; set; }
        
        //child models
        public Lots partialLots { get; set; }
        public Customers partialCustomers { get; set; }
        public CustomerAddress partialCustomerAddress { get; set; }
        public Items partialItems { get; set; }
        public ItemStructures partialItemStuctures { get; set; }
    }
}