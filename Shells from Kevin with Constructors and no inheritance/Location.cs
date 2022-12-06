public class Location
{
    public Location(int locNo, long phone, string city, string province, string zip, string streetName, int aptNo, int addressNum){
        Location_NO = locNo;
        PhoneNumber = phone;
        City = city;
        Province = province;
        Zip = zip;
        Street = streetName;
        Apt_No = aptNo;
        StreetAddress_No = addressNum; 
    }
    public Location()
    {
        public Int Location_NO { get; set; }
        public long PhoneNumber { get; set; }
        public String City { get; set; }
        public String Province { get; set; }
        public String Zip { get; set; }
        public String Street { get; set; }
        public Int Apt_No { get; set; }
        public Int StreetAddress_No { get; set; }
    }
}