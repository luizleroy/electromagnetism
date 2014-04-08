
public class SimpleRNG {
	
	private static Long m_w;
    private static Long m_z;
    
    SimpleRNG()
    {
        // These values are not magical, just the default values Marsaglia used.
        // Any pair of unsigned Longs should be fine.
        m_w = 521288629L;
        m_z = 362436069L;
    }
    
 // The random generator seed can be set three ways:
    // 1) specifying two non-zero unsigned Longs
    // 2) specifying one non-zero unsigned Long and taking a default value for the second
    // 3) setting the seed from the system time

    public static void SetSeed(Long u, Long v)
    {
        if (u != 0) m_w = u; 
        if (v != 0) m_z = v;
    }
    
    public static void SetSeed(Long u)
    {
        m_w = u;
    }
    
    public static void SetSeedFromSystemTime()
    {
//        System.DateTime dt = System.DateTime.Now;
//        Long x = dt.ToFileTime();
//        SetSeed((uint)(x >> 16), (uint)(x % 4294967296));
    }
    
    // Produce a uniform random sample from the open interval (0, 1).
    // The method will not return either end point.
    public static double GetUniform()
    {
    	// 0 <= u < 2^32
    	Long u = GetUint();
    	// The magic number below is 1/(2^32 + 2).
    	// The result is strictly between 0 and 1.
    	return 2*((Math.abs(u) + 1.0) * 2.328306435454494e-10) / 7.393804792359236e+04; //empírico: mairo valor encontrado, para normalização...;
    }
    
    // This is the heart of the generator.
    // It uses George Marsaglia's MWC algorithm to produce an unsigned Long.
    // See http://www.bobwheeler.com/statistics/Password/MarsagliaPost.txt
    private static Long GetUint()
    {
    	m_z = 36969 * (m_z & 65535) + (m_z >> 16);
    	m_w = 18000 * (m_w & 65535) + (m_w >> 16);
    	return (m_z << 16) + m_w;
    }
    

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SimpleRNG simpleRNG = new SimpleRNG();
		System.out.println(simpleRNG.GetUniform());
		System.out.println(simpleRNG.GetUniform());
		System.out.println(simpleRNG.GetUniform());
		System.out.println(simpleRNG.GetUniform());
//		Long m_z =  32;
//		System.out.println(m_z << 16);
	}

}
