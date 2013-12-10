package com.google.code.optimization.functions;

public class Function {
	public static TestFunction factoryMethod(String sFun) {
		switch (sFun) {
		case "rastrigin":
			return new Rastrigin();
		case "bohachevsky":
			return new Bohachevsky();
		case "designPressureVessel":
			return new DesignPressureVessel();
		case "designWeldedBeam":
			return new DesignWeldedBeam();
		default:
			throw new RuntimeException();
		}
	}
}