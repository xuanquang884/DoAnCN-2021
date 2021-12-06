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


        [Required(ErrorMessage = "Nhập Tên!")]
        [Display(Name = "Họ và tên:")]
        [StringLength(255)]
        public string Hoten { get; set; }

        [Required(ErrorMessage = "Nhập Email!")]
        [Display(Name = "Email")]
        [StringLength(255)]
        public string Gmail { get; set; }

        [Required(ErrorMessage = "Nhập số điện thoại!")]
        [Display(Name = "Số điện thoại")]
        [StringLength(255)]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Nhập nội dung!")]
        [StringLength(4000)]
        [Display(Name = "Nội dung")]
        public string NoiDung { get; set; }

        public DateTime Ngaytao { get; set; }
    }
}
