using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace CawoodClinic.Blazor.Data;

public static class PatientMethods
{


    public static IQueryable<Patient> GetUserPatients(this ApplicationDbContext ctx, string UserId)
    {

        var recursiveCte = (from r in ctx.Regions
                                 join u in ctx.Users
                                 on r.Id equals u.RegionId
                                 where u.Id == UserId
                                 select new { RegionId = r.Id, ParentRegionId = r.ParentId }).AsEnumerable();

        List<Guid?>regionIds = recursiveCte.Select(c => (Guid?)c.RegionId).ToList();


        while (true)
        {

            var nextLevel = (from r in ctx.Regions
                             join ac in recursiveCte
                             on r.ParentId equals ac.RegionId
                             select new { RegionId = r.Id, ParentRegionId = r.ParentId }).AsEnumerable();

            var newRegionIds = nextLevel.Select(r => (Guid?)r.RegionId).ToList();
            regionIds.AddRange(newRegionIds);
            newRegionIds = newRegionIds.Except(regionIds).ToList();
            if (newRegionIds.Count == 0) 
            { 
                break; 
            }
            
            recursiveCte.ToList().Clear();
            recursiveCte.ToList().AddRange(nextLevel);

        }

        var PatientList = ctx.Patients.Where(a => regionIds
                                      .Contains(a.RegionId))
                                      .Include(r => r.Region)
                                      .AsEnumerable();

        //var AllPatient = ctx.Patients.Include(r => r.Region)
        //                             .AsEnumerable();

        return PatientList.AsQueryable();

    }

    public static Task<bool> AddPatientAsync(this ApplicationDbContext ctx, Patient newPatient)
    {
        bool result = false;
        try
        {
            newPatient.Id = Guid.NewGuid();

            ctx.Patients.Add(newPatient);
            ctx.SaveChanges();
            result = true;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return Task.FromResult(result);
    }


    public static Task<bool> UpdatePatientAsync(this ApplicationDbContext ctx, Patient changedPatient)
    {
        bool result = false;
        try
        {
            //find the original patient object in the db
            var originalPatient = ctx.Patients.Single(p => p.Id == changedPatient.Id);
            //if the original patient object is found, update it with changed patient object values
            if (originalPatient != null)
            {
                ctx.Entry(originalPatient).CurrentValues.SetValues(changedPatient);
                ctx.SaveChanges();
                result = true;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return Task.FromResult(result);
    }   

}
