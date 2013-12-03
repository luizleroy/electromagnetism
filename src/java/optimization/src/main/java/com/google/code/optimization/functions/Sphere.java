package com.google.code.optimization.functions;


public class Sphere {
	
	/**
	 * Sphere of Ones
	 * @param dim
	 */
//	public Sphere(int dim) {
//		super(dim);
//		this.setUpDn();
//	}

//	@Override
//	public Double get(ArrayList<Double> x) {
//		Integer n = x.size();
//		double target = 0;
//		for (Integer i = 0; i < n; i++) {
//			double xi = x.get(i);
//			target += xi*xi;
//		}
//		return target;
//	}

//	@Override
//	public List<Double> getUp() {
//		return up;
//	}

//	@Override
//	public List<Double> getDn() {
//		return dn;
//	}

//	@Override
//	public void setUp(List<Double> up) {
//		this.up = up;
//	}

//	@Override
//	public void setDn(List<Double> dn) {
//		this.dn = dn;
//	}
	
//	private void setUpDn() {
//		double u = 1.;
//		List<Double> pgDn = new ArrayList<Double>();
//		List<Double> pgUp = new ArrayList<Double>();
//		for(int i = 0; i < dim; i++) {
//			pgDn.add(-1*Math.abs(u));
//			pgUp.add(Math.abs(u));
//		}
//		this.setDn(pgDn);
//		this.setUp(pgUp);
//	}

}
