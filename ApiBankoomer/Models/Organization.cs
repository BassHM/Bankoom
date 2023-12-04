namespace ApiBankoomer.Models
{
    public class Organization
    {
        public string IdOrganization { get; set; }
        public string Password { get; set; }
        public string ComercialName { get; set; }
        public byte IdState { get; set; }
    }
    public class OrganizationAccount
    {
        public int IdOrganizationAccount { get; set; }
        public string IdOrganization { get; set; }
        public string AccountName { get; set; }
        public decimal Balance { get; set; }
        public int Active { get; set; }
    }
    public class insertAccount
    {
        public string IdOrganization { get; set; }
        public string AccountName { get; set; }
        public decimal Balance { get; set; }
        public int Active { get; set; }
    }

}
