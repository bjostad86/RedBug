using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.Accounting
{
    [PrimaryKey(nameof(ID))]
    public class PriceGroups
    {
        [Required]
        [DisplayName("Price Group ID")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [DisplayName("Name")]
        [Column(TypeName = "varchar(50)")]
        public string Name { get; set; }
        
        [Required]
        [DisplayName("Price Code")]
        [Column(TypeName = "varchar(25)")]
        public string PriceCode { get; set; }
    }
}