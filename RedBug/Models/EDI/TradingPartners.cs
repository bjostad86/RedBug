using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.EDI
{
    [PrimaryKey(nameof(ID))]
    public class TradingPartners
    {
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(50)")]
        public string Name { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(1)")]
        public string Status { get; set; }
    }
}