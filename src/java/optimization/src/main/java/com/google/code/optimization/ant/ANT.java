package com.google.code.optimization.ant;

import java.util.Arrays;

import com.google.code.optimization.Tests;

public class ANT {

	public static void ant() {
		
		int n_for = 5;
		int n_cid = 5;
		double alfa = 2;
		double beta = 3;
		double Q = 10;
		double Q_dec = 10;
		
		double[] x_cid = new double[n_cid];
		for (int i = 0; i < n_cid; i++) {
			x_cid[i] = 10*Tests.random.nextDouble();
		}
		
		double[] y_cid = new double[n_cid];
		for (int i = 0; i < n_cid; i++) {
			y_cid[i] = 10*Tests.random.nextDouble();
		}
		
		System.out.println(Arrays.toString(x_cid));
		System.out.println(Arrays.toString(y_cid));
		
		double D[][] = new double[n_cid][n_cid];
		for (int j = 0; j < n_cid; j++) {
			for (int k = 0; k < n_cid; k++) {
				if (k >= j) {
					D[j][k] = Math.sqrt(Math.pow(x_cid[j] - x_cid[k], 2) + Math.pow(y_cid[j] - y_cid[k], 2));
				} else {
					D[j][k] = D[k][j];
				}
			}
		}

		//...
		
	}
	
	public static void main (String args[]) {
		ANT.ant();
		System.out.println("finish");
	}
}
