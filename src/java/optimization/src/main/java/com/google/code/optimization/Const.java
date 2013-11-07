package com.google.code.optimization;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Random;

public final class Const {
	public static final int numTest = 30;
	public static final Random random = new Random((new Date()).getTime());
//	public static final Random random = new Random(1L);
	public static final DecimalFormat decimalFormat = new DecimalFormat("0.000000000#E0");
	
	public static String sFun;
	public static Integer dims;
	public static Integer dots;
	public static Integer loop;
}