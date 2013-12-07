package com.google.code.optimization;

public class ArrayUtils {
	public static int findMinIndex(double[] forMin) {
		int minIndex = 0;
		for (int i = 1; i < forMin.length; i++) {
			double d = forMin[i];
			if ((d < forMin[minIndex])) {
				minIndex = i;
			}
		}
		return minIndex;
	}
}
