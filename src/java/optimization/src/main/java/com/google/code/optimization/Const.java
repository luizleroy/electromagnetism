package com.google.code.optimization;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

public final class Const {
//	public static final int nTest = 30;
	public static final Random random = new Random((new Date()).getTime());
//	public static final Random random = new Random(0);
	public static final DecimalFormat decimalFormat = new DecimalFormat("0.0000");
//	public static final DecimalFormat decimalFormat = new DecimalFormat("0.#E0");
	
	public static String sFun;
	public static Integer dim;
	public static Integer nPoint;
	public static Integer iLoop;
}