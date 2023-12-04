namespace ApiBankoomer.Models
{
    public class PostTransfer
    {
        public int cuentaOrigen { get; set; }
        public int cuentaDestino { get; set; }
        public decimal monto { get; set; }
        public string concepto { get; set; }
    }
}
