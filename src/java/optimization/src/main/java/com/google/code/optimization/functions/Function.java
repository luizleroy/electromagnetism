package com.google.code.optimization.functions;

public class Function {
	public static TestFunction factoryMethod(String sFun) {
		switch (sFun) {
		case "rastrigin":
			return new Rastrigin();
		case "bohachevsky":
			return new Bohachevsky();
		case "sphere":
			return new Sphere();
		case "schaffer":
			return new Schaffer();
		case "rosenbrock":
			return new Rosenbrock();
		case "schwefel_1":
			return new Schwefel_1();
		case "schwefel_2":
			return new Schwefel_2();
		case "schwefel_3":
			return new Schwefel_3();
		case "designPressureVessel":
			return new DesignPressureVessel();
		case "designWeldedBeam":
			return new DesignWeldedBeam();
		default:
			throw new RuntimeException();
		}
	}
}