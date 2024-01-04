using Microsoft.EntityFrameworkCore;

namespace CawoodClinic.Blazor.Data;

public static class RegionMethods
{
    public static IEnumerable<Region> GetUserRegions(this ApplicationDbContext ctx, string UserId)
    {
        var recursiveCte = (from r in ctx.Regions
                            join u in ctx.Users
                            on r.Id equals u.RegionId
                            where u.Id == UserId
                            select new { RegionId = r.Id, ParentRegionId = r.ParentId }).AsEnumerable();

        List<Guid?> regionIds = recursiveCte.Select(c => (Guid?)c.RegionId).ToList();


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

        var RegionList = ctx.Regions.Where(a => regionIds
                                      .Contains(a.Id))
                                        .AsEnumerable();


        return RegionList;

    }
}
