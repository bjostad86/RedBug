namespace RedBug.Models.MasterRecords
{
    public class MasterRecordsModel
    {
        public string partialView { get; set; }

        //child models
        public LotMaster partialLots { get; set; }
        public VendorMaster partialVendors { get; set; }
        public VendorAddress partialVendorAddresses { get; set; }
        public CustomerMaster partialCustomers { get; set; }
        public ItemMaster partialItems { get; set; }
        public ItemStructureMaster partialItemStuctures { get; set; }
    }
}