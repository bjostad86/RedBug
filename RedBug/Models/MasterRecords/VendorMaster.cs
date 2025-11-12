using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class VendorMaster
    {
        [Required]
        [DisplayName("Vendor #")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [DisplayName("Vendor Type")]
        [Column(TypeName = "int")]
        public int TypeID { get; set; }
        
        [Required]
        [DisplayName("Name")]
        [Column(TypeName = "varchar(50)")]
        public string Name { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(1)")]
        public string Status { get; set; }
        
        [Required]
        [Column(TypeName = "datetime")]
        public DateTime DateAdded { get; set; }
        
        [Column(TypeName = "datetime")]
        public DateTime? DateChanged { get; set; }
        
        [Column(TypeName = "varchar(30)")]
        public string? UserChanged { get; set; }
        
        [DisplayName("Terms")]
        [Column(TypeName = "varchar(5)")]
        public string? Terms { get; set; }
        
        [DisplayName("Last PO #")]
        [Column(TypeName = "varchar(20)")]
        public string? LastPo { get; set; }
        
        [DisplayName("Current Balance")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? CurrentBalance { get; set; }
        
        [DisplayName("Tax ID")]
        [Column(TypeName = "varchar(30)")]
        public string? TaxID { get; set; }
        
        [DisplayName("Contact Phone #")]
        [Column(TypeName = "varchar(15)")]
        public string? PhoneNbr { get; set; }
        
        [DisplayName("Contact Name")]
        [Column(TypeName = "varchar(50)")]
        public string? ContactName { get; set; }
        
        [DisplayName("Minimum Order Amount")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? MinOrderAmt { get; set; }
        
        [DisplayName("GL Account #")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? GlAccountNbr { get; set; }
        
        [DisplayName("VAT Registration #")]
        [Column(TypeName = "varchar(50)")]
        public string? VatRegNbr { get; set; }
        
        [DisplayName("Default Carrier")]
        [Column(TypeName = "varchar(50)")]
        public string? DefaultCarrier { get; set; }
        
        [DisplayName("User Defined 1")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef1 { get; set; }
        
        [DisplayName("User Defined 2")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef2 { get; set; }
        
        [DisplayName("User Defined 3")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef3 { get; set; }
        
        [NotMapped]
        public VendorAddress address { get; set; }
    }

    [PrimaryKey(nameof(ID), nameof(VendorID))]
    public class VendorAddress
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "int")]
        public int VendorID { get; set; }
        
        [Required]
        [Column(TypeName = "datetime")]
        public DateTime DateAdded { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(50)")]
        public string Name { get; set; }
        
        [Required]
        [DisplayName("Address")]
        [Column(TypeName = "varchar(50)")]
        public string Address1 { get; set; }
        
        [DisplayName("Address 2")]
        [Column(TypeName = "varchar(50)")]
        public string? Address2 { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(50)")]
        public string City { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(3)")]
        public string State { get; set; }
        
        [Required]
        [DisplayName("Postal Code")]
        [Column(TypeName = "varchar(8)")]
        public string PostalCode { get; set; }
        
        [Column(TypeName = "varchar(8)")]
        public string? Country { get; set; }
        
        [Column(TypeName = "bit")]
        public bool? Primary { get; set; }
        
        [DisplayName("DUNS")]
        [Column(TypeName = "varchar(20)")]
        public string? Duns { get; set; }
        
        [DisplayName("Phone #")]
        [Column(TypeName = "varchar(15)")]
        public string? PhoneNbr { get; set; }
        
        [DisplayName("Contact")]
        [Column(TypeName = "varchar(50)")]
        public string? ContactName { get; set; }
        
        [Column(TypeName = "varchar(4000)")]
        public string? Comments { get; set; }
        
        [DisplayName("User Defined 1")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef1 { get; set; }
        
        [DisplayName("User Defined 2")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef2 { get; set; }
        
        [DisplayName("User Defined 3")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef3 { get; set; }
    }

    [PrimaryKey(nameof(ID))]
    public class VendorType
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string Type { get; set; }
    }
}