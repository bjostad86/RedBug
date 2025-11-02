using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    public class MasterRecordsContext : DbContext
    {
        public DbSet<VendorMaster> VendorMaster { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("");
        }
    }
}