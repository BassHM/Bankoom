namespace ApiBankoomer.Models
{
    public class PostState
    {
        public string stateName { get; set; }
        public int idCountry { get; set; }
    }
    public class GetState
    {
        public int idState { get; set; }
        public string stateName { get; set; }
    }
    public class GetStates
    {
        public int idState { get; set; }
        public string stateName { get; set; }
        public string stateForCurp { get; set; }
    }
}
