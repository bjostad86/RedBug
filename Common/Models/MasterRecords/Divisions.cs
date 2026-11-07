using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Common.Models.MasterRecords
{
    [PrimaryKey(nameof(ID))]
    public class Divisions
    {
        //These are user controlled and would be a unique identifier  
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string Division { get; set; }
        
        [Column(TypeName = "varchar(500)")]
        public string? Description { get; set; }
    }
}