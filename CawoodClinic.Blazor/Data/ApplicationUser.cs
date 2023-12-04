using Microsoft.AspNetCore.Identity;

namespace CawoodClinic.Blazor.Data
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    public class ApplicationUser : IdentityUser
    {
        public int? RegionId { get; set; }

        public virtual Region? Region { get; set; }

        public virtual bool IsDeleted { get; set; }
    }
}
