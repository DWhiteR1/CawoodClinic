using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CawoodClinic.Blazor.Data;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : IdentityDbContext<ApplicationUser>(options)
{
    public virtual DbSet<Appointment> Appointments { get; set; }

    public virtual DbSet<AppointmentStatus> AppointmentStatuses { get; set; }

    public virtual DbSet<Dbsync> Dbsyncs { get; set; }

    public virtual DbSet<Measurement> Measurements { get; set; }

    public virtual DbSet<MeasurementType> MeasurementTypes { get; set; }

    public virtual DbSet<MenuItem> MenuItems { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<Region> Regions { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Appointment>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.AppointmentNotes).HasMaxLength(500);
            entity.Property(e => e.AppointmentReason).HasMaxLength(255);
            entity.Property(e => e.UserId)
                .IsRequired()
                .HasMaxLength(450);

            entity.HasOne(d => d.AppointmentStatus).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.AppointmentStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Appointments_AppointmentStatus");

            entity.HasOne(d => d.Patient).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.PatientId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Appointments_Patients");
        });

        modelBuilder.Entity<AppointmentStatus>(entity =>
        {

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(50);
        });



        modelBuilder.Entity<Measurement>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Value).HasMaxLength(100);

            entity.HasOne(d => d.MeasurementType).WithMany(p => p.Measurements)
                .HasForeignKey(d => d.MeasurementTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Measurement_MeasurementTypes");

            entity.HasOne(d => d.Patient).WithMany(p => p.Measurements)
                .HasForeignKey(d => d.PatientId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Measurement_Patients");
        });

        modelBuilder.Entity<MeasurementType>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.DataTypeOfMeasurement)
                .IsRequired()
                .HasMaxLength(30);
            entity.Property(e => e.FormatOfMeasurement).HasMaxLength(75);
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(75);
        });

        modelBuilder.Entity<MenuItem>(entity =>
        {
            entity.Property(e => e.IconName)
                .IsRequired()
                .HasMaxLength(255);
            entity.Property(e => e.MenuName)
                .IsRequired()
                .HasMaxLength(255);
            entity.Property(e => e.NameSpace)
                .IsRequired()
                .HasMaxLength(50);
            entity.Property(e => e.PageName)
                .IsRequired()
                .HasMaxLength(255);
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.ContactNumber).HasMaxLength(25);
            entity.Property(e => e.EmailAddress).HasMaxLength(255);
            entity.Property(e => e.Gender).HasMaxLength(10);
            entity.Property(e => e.IdNumber).HasMaxLength(25);
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(75);
            entity.Property(e => e.PhysicalAddress).HasMaxLength(255);
            entity.Property(e => e.Surname)
                .IsRequired()
                .HasMaxLength(75);

            entity.HasOne(d => d.Region).WithMany(p => p.Patients)
                .HasForeignKey(d => d.RegionId)
                .HasConstraintName("FK_Patients_Regions");
        });

        modelBuilder.Entity<Region>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name).HasMaxLength(100);

            entity.HasOne(d => d.Parent).WithMany(p => p.InverseParent)
                .HasForeignKey(d => d.ParentId)
                .HasConstraintName("FK_Regions_Regions");
        });

        base.OnModelCreating(modelBuilder);
    }

}



