using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class Customers
    {
        [Required]
        [DisplayName("Customer #")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [DisplayName("Customer Type")]
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
        
        [Column(TypeName = "varchar(50)")]
        public string? UserChanged { get; set; }
        
        [DisplayName("Terms")]
        [Column(TypeName = "varchar(5)")]
        public string? Terms { get; set; }
        
        [Required]
        [DisplayName("Division")]
        [Column(TypeName = "int")]
        public int DivisionID { get; set; }
        
        [Required]
        [DisplayName("Payment Method")]
        [Column(TypeName = "int")]
        public int PaymentMethodID { get; set; }
        
        [DisplayName("Minimum Order Amount")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? MinOrderAmt { get; set; }
        
        [DisplayName("Maximum Order Amount")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? MaxOrderAmt { get; set; }
        
        [DisplayName("Default Carrier")]
        [Column(TypeName = "varchar(50)")]
        public string? DefaultCarrier { get; set; }
        
        [DisplayName("GL Account #")]
        [Column(TypeName = "decimal(20, 2)")]
        public decimal? GlAccountNbr { get; set; }
        
        [DisplayName("Email Address")]
        [Column(TypeName = "varchar(100)")]
        public string? EmailAddress { get; set; }
        
        [DisplayName("Default Currency")]
        [Column(TypeName = "int")]
        public int? DefaultCurrencyID { get; set; }
        
        [DisplayName("Price Group")]
        [Column(TypeName = "int")]
        public int? PriceGroupID { get; set; }
        
        [DisplayName("Internal Comments")]
        [Column(TypeName = "varchar(4000)")]
        public string? InternalComments { get; set; }
        
        [DisplayName("Shipping Comments")]
        [Column(TypeName = "varchar(4000)")]
        public string? ShippingComments { get; set; }
        
        [DisplayName("Phone #")]
        [Column(TypeName = "varchar(15)")]
        public string? PhoneNbr { get; set; }
        
        [DisplayName("Fax #")]
        [Column(TypeName = "varchar(15)")]
        public string? FaxNbr { get; set; }
        
        [DisplayName("Tax ID")]
        [Column(TypeName = "varchar(50)")]
        public string? TaxID { get; set; }
        
        [DisplayName("User Defined 1")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef1 { get; set; }
        
        [DisplayName("User Defined 2")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef2 { get; set; }
        
        [DisplayName("User Defined 3")]
        [Column(TypeName = "varchar(50)")]
        public string? UserDef3 { get; set; }
        
        [Column(TypeName = "varchar(50)")]
        public string? RecordLockedUser { get; set; }
        
        [Column(TypeName = "datetime")]
        public DateTime? RecordLockedTime { get; set; }
        
        [NotMapped]
        public CustomerAddress address { get; set; }
    }

    [PrimaryKey(nameof(ID), nameof(CustomerID))]
    public class CustomerAddress
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }

        [Required] [Column(TypeName = "int")] public int CustomerID { get; set; }

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

        [Column(TypeName = "varchar(8)")] public string? Country { get; set; }

        [Column(TypeName = "bit")] public bool? Primary { get; set; }

        [DisplayName("DUNS")]
        [Column(TypeName = "varchar(20)")]
        public string? Duns { get; set; }

        [DisplayName("Phone #")]
        [Column(TypeName = "varchar(15)")]
        public string? PhoneNbr { get; set; }

        [DisplayName("Contact")]
        [Column(TypeName = "varchar(50)")]
        public string? ContactName { get; set; }

        [Column(TypeName = "varchar(4000)")] public string? Comments { get; set; }

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
    public class CustomerTypes
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