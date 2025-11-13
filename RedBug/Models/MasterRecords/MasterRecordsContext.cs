using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    public class MasterRecordsContext : DbContext
    {
        public DbSet<Customers> Customers { get; set; }
        public DbSet<CustomerAddress> CustomerAddress { get; set; }
        public DbSet<CustomerTypes> CustomerTypes { get; set; }
        public DbSet<Divisions> Divisions { get; set; }
        public DbSet<PaymentMethods> PaymentMethods { get; set; }
        public DbSet<Vendors> Vendors { get; set; }
        public DbSet<VendorAddress> VendorAddress { get; set; }
        public DbSet<VendorTypes> VendorTypes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("DB");
        }
    }
}