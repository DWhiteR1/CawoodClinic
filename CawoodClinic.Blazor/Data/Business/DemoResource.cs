#nullable disable
namespace CawoodClinic.Blazor.Data.Business;

public class DemoResource
{
    public int Id { get; set; }
    public int? GroupId { get; set; }
    public string Name { get; set; }
    public bool IsGroup { get; set; }
    public string TextCss { get; set; }
    public string BackgroundCss { get; set; }
    public string ImageFileName => $"employees/{Id + 1}.jpg";
    public override bool Equals(object obj)
    {
        DemoResource resource = obj as DemoResource;
        return resource != null && resource.Id == Id;
    }
    public override int GetHashCode()
    {
        return Id;
    }
}
