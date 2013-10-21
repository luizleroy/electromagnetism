package com.google.code.optimization.functions;

import java.util.List;

public abstract class EngFunction extends Function {
	public EngFunction(int dim) {
		super(dim);
	}

	public abstract List<Double> getRestricN(List<Double> x);
}
