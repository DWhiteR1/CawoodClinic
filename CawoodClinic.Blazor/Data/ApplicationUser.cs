using Microsoft.AspNetCore.Identity;

namespace CawoodClinic.Blazor.Data
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    public class ApplicationUser : IdentityUser
    {
        public bool IsDeleted { get; set; }

        public Guid? RegionId { get; set; }

        public string? ParentId { get; set; }

        public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

        public virtual ICollection<ApplicationUser> InverseParent { get; set; } = new List<ApplicationUser>();

        public virtual ApplicationUser Parent { get; set; }

        public virtual Region Region { get; set; }
    }
}
