package com.google.code.optimization.functions;

import java.util.ArrayList;

//0.7854x1xx2(3.3333xx3+14.9334x3 - 43.0934) - 1.508x1(xx6 + xx7)+ 7,4777(xxx6 + xxx7) + 0.7854(x4xx6+x5xx7)
public class Function04 extends EngFunction {
	public Function04(int dim) {
		super(dim);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (7 != x.size()) {
		throw new RuntimeException();
		}
		double x1 = x.get(0);
		double x2 = x.get(1);
		double x3 = x.get(2);
		double x4 = x.get(3);
		double x5 = x.get(4);
		double x6 = x.get(5);
		double x7 = x.get(6);
		
		
//		double xx1 = x1*x1;
		double xx2 = x2*x2;
		double xx3 = x3*x3;
//		double xx4 = x4*x4;
//		double xx5 = x5*x5;
		double xx6 = x6*x6;
		double xx7 = x7*x7;
		
		double xxx6 = x6*xx6;
		double xxx7 = x7*xx7;
		
		return 0.7854*x1*xx2*(3.3333*xx3+14.9334*x3 - 43.0934) - 1.508*x1*(xx6 + xx7)+ 7.4777*(xxx6 + xxx7) + 0.7854*(x4*xx6+x5*xx7);
	}
}