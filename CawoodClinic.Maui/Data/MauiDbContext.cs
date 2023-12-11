using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using CawoodClinic.Maui.Data.Models;

namespace CawoodClinic.Maui.Data;
public partial class MauiDbContext : DbContext
{
    public MauiDbContext(DbContextOptions<MauiDbContext> options) : base(options)
    {
        Database.Migrate();
    }

 

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(MauiDbContext).Assembly);
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
