package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

public abstract class EngFunction extends Function {
	public EngFunction(int dim) {
		super(dim);
	}

	public abstract List<Double> getRestricN(List<Double> x);
	

	@Override
	public List<Double> getUp() {
		return up;
	}

	@Override
	public List<Double> getDn() {
		return dn;
	}

	@Override
	public void setUp(List<Double> up) {
		this.up = up;
	}

	@Override
	public void setDn(List<Double> dn) {
		this.dn = dn;
	}
	
	protected abstract void setEngUpDn();
}
