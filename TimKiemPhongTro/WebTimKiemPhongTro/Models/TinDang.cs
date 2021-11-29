namespace WebTimKiemPhongTro.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TinDang")]
    public partial class TinDang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TinDang()
        {
            GiaoDich = new HashSet<GiaoDich>();
        }

        [Key]
        public int MaTin { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tiêu đề!")]
        [StringLength(550)]
        public string TieuDe { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập chuyên mục!")]
        [StringLength(250)]
        public string ChuyenMuc { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập giá tiền!")]
        [Display(Name = "Giá Tiền")]
        public int GiaTien { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập diện tích phòng!")]
        [Display(Name = "Diện Tích")]
        public int DienTich { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả phòng!")]
        [StringLength(4000, ErrorMessage = "Tối đa 4000 kí tự!")]
        public string MoTa { get; set; }

        public DateTime NgayDang { get; set; }

        [Required]
        [StringLength(128)]
        public string MaNguoiDang { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ!")]
        [StringLength(250, ErrorMessage = "Tối đa 250 kí tự!")]
        public string DiaChi { get; set; }

        public string Image { get; set; }

        public int? LoaiTin { get; set; }

        public int? SoNgay { get; set; }

        public virtual AspNetUsers AspNetUsers { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GiaoDich> GiaoDich { get; set; }

        public virtual Loai Loai { get; set; }
        public string Zalo;
        public string Facebook;
        public string Name;
        public string Sdt;
        public string email;
        public List<Loai> ListLoaiTin;
    }
}
