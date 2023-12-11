using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Maui.Data;
// Implement IDbContextFactory
public interface IMauiDbContextFactory<TContext>
    where TContext : DbContext
{
    TContext CreateDbContext();
    string DatabasePath { get; set; }
}


public class MauiDbContextFactory : IMauiDbContextFactory<MauiDbContext>
{
    public MauiDbContext CreateDbContext()
    {
        // Implement the logic to create and configure your DbContext
        var optionsBuilder = new DbContextOptionsBuilder<MauiDbContext>();
        optionsBuilder.UseSqlite($"Filename={DatabasePath}", x => x.MigrationsAssembly("CawoodClinic.Maui.Data"));

        return new MauiDbContext(optionsBuilder.Options);
    }

    public string DatabasePath { get; set; } 
}
