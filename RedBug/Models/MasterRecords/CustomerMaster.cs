using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class CustomerMaster
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
        
        [Column(TypeName = "varchar(30)")]
        public string? UserChanged { get; set; }
        
        [DisplayName("Terms")]
        [Column(TypeName = "varchar(5)")]
        public string? Terms { get; set; }
        
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
    }
}