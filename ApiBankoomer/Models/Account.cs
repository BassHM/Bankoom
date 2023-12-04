namespace ApiBankoomer.Models
{
    public class GetAccount
    {
        public string monedaIsoCode { get; set; }
        public string cuentaTipo { get; set; }
        public double balance { get; set; }
        public string nombre { get; set; }
        public string cuenta { get; set; }
        public string nombreMoneda { get; set; }
    }
    public class Movimientos
    {
        public string fechaMovimiento { get; set; }
        public string concepto { get; set; }
        public double monto { get; set; }
    }
    public class HomeInfo
    {
        public string nombre { get; set; }
        public float income { get; set; }
        public float expenses { get; set; }
    }
    public class newAccount
    {
        public string idUser { get; set; }
        public int idTipoDeCuenta { get; set; }
        public string nombre { get; set; }
        public decimal montoInicial { get; set; }
    }
}
