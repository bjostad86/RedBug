using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.Accounting
{
    [PrimaryKey(nameof(SID))]
    public class PriceCodes
    {
        [Required]
        [Column(TypeName = "varchar(25)")]
        public string SID { get; set; }

        [Required]
        [Column(TypeName = "varchar(25)")]
        public string Description { get; set; }
    }
}