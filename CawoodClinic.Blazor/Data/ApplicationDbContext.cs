using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CawoodClinic.Blazor.Data;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : IdentityDbContext<ApplicationUser>(options)
{
    public DbSet<Region> Regions { get; set; } = null!;
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Region>(entity =>
        {
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.IsDeleted).IsRequired().HasDefaultValue(false);
            entity.HasOne(d => d.ParentRegion).WithMany(p => p.ChildRegions).HasForeignKey(d => d.ParentId);
            entity.Ignore(c => c.ParentRegion);
        });


        base.OnModelCreating(modelBuilder);
    }
}



