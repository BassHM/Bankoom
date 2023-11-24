namespace ApiBankoomer.Models
{
    public class GetAccount
    {
        public int idAccountSender { get; set; }
        public int idAccountReceiver { get; set; }
        public decimal amount { get; set; }
        public string concept { get; set; }
    }
}
