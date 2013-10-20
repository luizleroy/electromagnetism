package com.google.code.optimization.functions;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import com.google.code.optimization.Const;
import com.google.code.optimization.MyArrayList;

public abstract class Function {
	File f;
	private int dim;
	final Random random = new Random(0);

	public Function(int dim) {
		this.setDim(dim);
//		System.out
//				.println("I'am " + this.toString() + "   dim" + this.getDim());
	}

	protected ArrayList<Double> x;

	public abstract Double get(ArrayList<Double> x);

	/**
	 * @param args
	 */

	public void write() {
		List<Double> x = new MyArrayList<Double>();
		for (int i = 0; i < 3; i++) {
			x.add(1+98*random.nextDouble());
			x.add(1+98*random.nextDouble());
			x.add(10+190*random.nextDouble());
			x.add(10+190*random.nextDouble());
			this.setX(x);
			Double result = this.get((ArrayList<Double>) this.getX());
			System.out.println(x);
			System.out.println(Const.decimalFormat.format(result));
			System.out.println();
			x.clear();
		}
	}

	private ArrayList<Double> getX() {
		return x;
	}

	private void setX(List<Double> x) {
		this.x = (ArrayList<Double>) x;
	}

	public int getDim() {
		return dim;
	}

	public void setDim(int dim) {
		this.dim = dim;
	}

	public static void main(String[] args) {
		Function f = new G4();
		f.write();
	}
}
