package com.google.code.optimization.functions;

import java.util.ArrayList;

public class G4 extends EngFunction {
	public G4(int dim) {
		super(dim);
	}

	public G4() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (4 != x.size()) {
		throw new RuntimeException();
		}
		double x4 = x.get(3);
		return x4 - 240;
	}
}