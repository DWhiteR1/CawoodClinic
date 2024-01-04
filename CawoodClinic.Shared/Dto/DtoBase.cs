#nullable disable
namespace CawoodClinic.Shared.Dto;
public record DtoBase
{
    public string Crud { get; init; }
    public int Version { get; init; }
    public Guid Id { get; init; }
    public string CreatedBy { get; init; }
    public DateTime CreatedDate { get; init; }
    public string UpdatedBy { get; init; }
    public DateTime? UpdatedDate { get; init; }
    public bool IsDeleted { get; init; }
}
