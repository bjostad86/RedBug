using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.Controls
{
    [PrimaryKey(nameof(ID))]
    public class Currencies
    {
        [Required]
        [DisplayName("Customer #")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
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
    }
}