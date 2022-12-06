public class BoatSailor
{
    public BoatSailor(int sailorLicense, string fname, string lname, int addNum, string streetName, int apt, string province, string zip){
        License_NO = sailorLicense;
        FName = fname;
        LName = lname;
        StreetAddress_No = addNum;
        Street = streetName;
        Apt_No = apt;
        Province = province;
        Zip = zip; 
    }
    public BoatSailor()
    {
        public Int License_NO { get; set; }
        public String FName { get; set; }
        public String LName { get; set; }
        public Int StreetAddress_No { get; set; }
        public String Street { get; set; }
        public Int Apt_No { get; set; }
        public String Province { get; set; }
        public String Zip { get; set; }
    }
}