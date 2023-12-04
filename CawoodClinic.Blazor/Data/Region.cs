namespace CawoodClinic.Blazor.Data
{
    public partial class Region
    {
        public int RegionId { get; set; }

        public int? ParentId { get; set; }

        public string Name { get; set; }

        public virtual bool IsDeleted { get; set; }

        public virtual Region ParentRegion { get; set; }

        public virtual ICollection<Region> ChildRegions { get; set; } = new List<Region>();

    }
}
