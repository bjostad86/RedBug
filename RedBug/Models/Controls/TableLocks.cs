using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RedBug.Models.Controls
{
    [PrimaryKey(nameof(TableName), nameof(UserName))]
    public class TableLocks
    {
        [Required]
        [DisplayName("Table Name")]
        [Column(TypeName = "varchar(50)")]
        public string TableName { get; set; }
        
        [Required]
        [DisplayName("User")]
        [Column(TypeName = "varchar(50)")]
        public string UserName { get; set; }
        
        [Required]
        [DisplayName("Lock Time")]
        [Column(TypeName = "datetime")]
        public DateTime LockTime { get; set; }
        
        [Required]
        [DisplayName("Lock Type")]
        [Column(TypeName = "datetime")]
        public string LockType { get; set; }
        
        [DisplayName("Prior Record")]
        [Column(TypeName = "xml")]
        public string? PriorRecord { get; set; }
        
        [DisplayName("Attempted Record")]
        [Column(TypeName = "xml")]
        public string? AttemptedRecord { get; set; }
    }
}