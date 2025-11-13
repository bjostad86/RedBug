using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class PaymentMethods
    {
        /*
         * Default payment Method for a customer. The payment instrument specifies how payments are made by the customer.
         * The Default types will be, Check, Draft, Electronic funds transfer
         */
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string Method { get; set; }
        
        [Column(TypeName = "varchar(500)")]
        public string? Description { get; set; }
    }
}