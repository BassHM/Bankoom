namespace ApiBankoomer.Models
{
    public class UserLogin
    {
        public string idUser { get; set; }
        public string password { get; set; }
    }
    public class SignInUser
    {
        public string idUser { get; set; } // Assuming varchar(15)
        public string password { get; set; } // Assuming varchar(45)
        public string name { get; set; } // Assuming varchar(45)
        public string lastName { get; set; } // Assuming varchar(45)
        public string secondLastName { get; set; } // Assuming varchar(45)
        public DateOnly dateOfBirth { get; set; } // Assuming date
        public string curp { get; set; } // Assuming varchar(18)
        public int phoneNumber { get; set; } // Assuming int
        public string address { get; set; } // Assuming varchar(90)
        public int postalCode { get; set; } // Assuming mediumint
        public string email { get; set; } // Assuming varchar(30)
        public int idState { get; set; } // Foreign Key
    }
    public class getUser
    {
        string name { get; set; }
        string lastName { get; set; }
        string secondLastName { get; set; }
        string countryOfResidence { get; set; }
        string stateOfResidence { get; set; }
        string curp { get; set; }
        int phoneNumber { get; set; }
        string adress { get; set; }
        int postalCode { get; set; }
        string email { get; set; }
    }
}
