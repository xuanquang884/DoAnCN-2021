namespace WebTimKiemPhongTro.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AccountAdmin")]
    public partial class AccountAdmin
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [StringLength(128)]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
        public string Email { get; set; }


        [StringLength(128)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập họ và tên")]
        [StringLength(128)]
        public string Name { get; set; }

        [StringLength(128)]
        public string SDT { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập Password")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$")]
        [StringLength(128)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Vui lòng xác nhận password")]
        [StringLength(128)]
        public string Xacnhanpassword { get; set; }


        public string DangNhapThatBai;

        internal object OrderBy(Func<object, object> p)
        {
            throw new NotImplementedException();
        }
    }
}
