package com.google.code.optimization.functions;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public abstract class Function {
	File f;
	private int dim;
	final Random random = new Random(0);
	protected static final int SAMPLES = 10;

	public Function(int dim) {
		this.setDim(dim);
	}

	protected ArrayList<Double> x;

	public abstract Double get(ArrayList<Double> x);

	public ArrayList<Double> getX() {
		return x;
	}

	public void setX(List<Double> x) {
		this.x = (ArrayList<Double>) x;
	}

	public int getDim() {
		return dim;
	}

	public void setDim(int dim) {
		this.dim = dim;
	}
}
