namespace ApiBankoomer.Models
{
    public class SignPeriodicPayment
    {
        public int idOrganizationAccount { get; set; } // Assuming int
        public int idAccount { get; set; }
        public decimal amount { get; set; }
    }
}
