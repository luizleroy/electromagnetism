package com.google.code.optimization.functions;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class Function {
	File f;
	public /*static final*/ Integer dim;
	protected static final int SAMPLES = 10;
	protected /*static final*/ List<Double> up = new ArrayList<Double>();
	protected /*static final*/ List<Double> dn = new ArrayList<Double>();

	public Function(int dim) {
		this.dim = dim;
	}

	public List<Double> getUp() {
		return up;
	}

	public void setUp(List<Double> up) {
		this.up = up;
	}

	public List<Double> getDn() {
		return dn;
	}

	public void setDn(List<Double> dn) {
		this.dn = dn;
	}

	protected ArrayList<Double> x;

	public abstract Double get(ArrayList<Double> x);

	public ArrayList<Double> getX() {
		return x;
	}

	public void setX(List<Double> x) {
		this.x = (ArrayList<Double>) x;
	}

	public Double[] F(Double[][] s) {
		Double f[] = new Double[s.length];
		for(int i = 0; i < s.length; i++) {
			f[i] = this.get(new ArrayList<Double>(Arrays.asList(s[i])));
		}
		return f;
	}
}
