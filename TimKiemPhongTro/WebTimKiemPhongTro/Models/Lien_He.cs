namespace WebTimKiemPhongTro.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Lien_He
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }


        [Required(ErrorMessage = "Nhập họ tên (*)!")]
        [StringLength(255)]
        public string Hoten { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email (*)!")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
        [Display(Name = "Email")]
        [StringLength(255)]
        public string Gmail { get; set; }

        [Required(ErrorMessage = "Nhập số điện thoại (*)!")]
        [StringLength(255)]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Nhập số điện thoại (*)!")]
        [StringLength(255)]
        public string TieuDe { get; set; }

        [Required(ErrorMessage = "Nhập nội dung (*)!")]
        [StringLength(4000)]
        public string NoiDung { get; set; }
    }
}
