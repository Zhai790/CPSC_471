public class Amenities
{
    public Amenities()
    {
        public Int Location_NO { get; set; }
        public Int Amenities_ID { get; set; }
    }
}

public class Barbeque : Amenities
{
    public Barbeque()
    {
        public Int Num_Grills { get; set; }
    }
}

public class SwimmingPool : Amenities
{
    public SwimmingPool()
    {
        public Int Num_Lanes { get; set; }
        public Int PoolSize { get; set; }
    }
}