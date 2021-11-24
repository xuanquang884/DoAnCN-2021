namespace WebTimKiemPhongTro.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GiaoDich")]
    public partial class GiaoDich
    {
        public int Id { get; set; }

        [StringLength(128)]
        public string MaUser { get; set; }

        public int? MaTin { get; set; }

        public int? SoTien { get; set; }

        public DateTime? ThoiGian { get; set; }

        public virtual AspNetUsers AspNetUsers { get; set; }

        public virtual TinDang TinDang { get; set; }
        public string Name;
    }
}
