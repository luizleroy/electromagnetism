package com.google.code.optimization;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.google.code.optimization.functions.Function;
import com.google.code.optimization.functions.TestFunction;
import com.google.code.optimization.ga.GA;
import com.google.code.optimization.pso.PSO;

public class Tests {
	private static final int numExec = 10;
	public static String sFun = "designWeldedBeam";
	public static TestFunction func = Function.factoryMethod(Tests.sFun);
	public static final int dims = 4;
	public static final int loop = 3*5000/2;
	public static final int dots = 2*5000*2;

	public static final Random random = new Random(System.nanoTime());

	// GA
	public static final float pc = 0.6f;
	public static final float pm = 0.2f;
	public static final short bits = 40; // max 63 or 64

	// PSO
	public static final double c1 = 0.85;
	public static final double c2 = 0.55;
	public static final double W1 = 0.15;
	public static final double W2 = 0.50;

	public static void main(String args[]) {
		SimpleDateFormat dt = new SimpleDateFormat("yy/MM/dd HH:mm EEE");
		System.out.println(dt.format(new Date()));
//		String sFuncts[] = { "bohachevsky", "bohachevsky", "bohachevsky",
//				"bohachevsky", "bohachevsky", "bohachevsky", "bohachevsky",
//				"bohachevsky", "bohachevsky", "rastrigin"};
		for (int i = 0; i < numExec; i++) {
//			sFun = sFuncts[0];
//			func = Function.factoryMethod(Tests.sFun);
			optimizationBy("pso");
		}
		System.out.println(dt.format(new Date()));
	}

	private static double optimizationBy(String method) {
		/* To utilize quality measure, needed only 30 tests... */
		short numTest = 3;

		long initialTime = System.currentTimeMillis();
		double mse = 0.;
		switch (method) {
		case "ga":
			for (short i = 0; i < numTest; i++) {
				double bestGA[] = GA.ga();
				mse += resultTest(bestGA);
			}
			break;
		case "pso":
			for (int i = 0; i < numTest; i++) {
				double bestPSO[] = PSO.pso();
				mse += resultTest(bestPSO);
//				System.out.println(Arrays.toString(bestPSO));
			}
			break;
		default:
			throw new RuntimeException();
		}
		long finalTime = System.currentTimeMillis();

		double mean = mse / numTest;
		long tt = finalTime - initialTime; // total time
		long time = tt / numTest;
		Date dateSpeed = new Date(time);
		SimpleDateFormat dt = new SimpleDateFormat("mm:ss");
		String mtime = "NAN";
		DecimalFormat f = new DecimalFormat("0,000");
		if (time > 30_000) {
			mtime = time > 3_600_000 ? "+1h" : dt.format(dateSpeed);
		} else {
			mtime = f.format(time) + " ms";
		}
		dt = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		char tab = '\t';
		String form = "%s%c%s%c%d%c%s%c%s%c%s%c%s%c%s%c%s%c%e";
		String chamada = f.format(Tests.func.getCounter() / numTest);
		Tests.func.resetCounter();
		String d = dt.format(new Date());
		System.out.println(String.format(form, d, tab, Tests.sFun, tab,
				Tests.dims, tab, method, tab, Tests.loop, tab, numTest, tab,
				Tests.dots, tab, mtime, tab, chamada, tab, mean));
		return mean;
	}

	// MSE - mean square error
	//
	private static double resultTest(double[] best) {
		double mse = 0;
		double optimum[] = Tests.func.getOptimum();
		for (int i = 0; i < Tests.dims; i++) {
			mse += Math.pow((best[i] - optimum[i]), 2);
		}
		return Math.sqrt(mse) / Tests.dims;
	}
}