namespace ApiBankoomer.Models
{
    public class User
    {
        public int idUser { get; set; }
        public string name { get; set; }
        public string lastName { get; set; }
        public string secondLastName { get; set; }
        public int idStateOfBirth { get; set; }
        public int idCountryOfBirth { get; set; }
        public int idGender { get; set; }
        public int idProfession { get; set; }
        public DateTime dateOfBirth { get; set; }
        public string curp { get; set; }
        public string? rfc { get; set; }
        public string phoneNumber { get; set; }
        public string address { get; set; }
        public string postalCode { get; set; }
        public string email { get; set; }
        public DateTime dateOfCreation { get; set; }
        public int statusId { get; set; }
    }
}
