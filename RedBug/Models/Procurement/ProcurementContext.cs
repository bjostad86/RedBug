using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.Procurement;

public class ProcurementContext : DbContext
{
    public DbSet<Vendors> Vendors { get; set; }
    public DbSet<VendorAddress> VendorAddress { get; set; }
    public DbSet<VendorTypes> VendorTypes { get; set; }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("DB");
    }
}