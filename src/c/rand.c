/*c*/
#include<stdio.h>

int GetUint(int mz)
{
	int m_z = mz;
	int m_w = 1;
    m_z = 36969 * (m_z & 65535) + (m_z >> 16);
    m_w = 18000 * (m_w & 65535) + (m_w >> 16);
    return (m_z << 16) + m_w;
}

main() {
	printf("%d\nend\n",GetUint(1));
	printf("%d\nend\n",GetUint(2));
	printf("%d\nend\n",GetUint(3));
	return 0;
}

/*java*/
//public class UserDetailsController {
//
//	static int GetUint(int mz) {
//		int m_z = mz;
//		int m_w = 1;
//		m_z = 36969 * (m_z & 65535) + (m_z >> 16);
//		m_w = 18000 * (m_w & 65535) + (m_w >> 16);
//		return (m_z << 16) + m_w;
//	}
//
//	
//	public static void main(String args[]) {
//		System.out.println(GetUint(1));
//		System.out.println(GetUint(2));
//		System.out.println(GetUint(3));
//	}
//}