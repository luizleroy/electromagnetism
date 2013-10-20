package com.google.code.optimization;
import java.util.ArrayList;


@SuppressWarnings("serial")
public class MyArrayList<T> extends ArrayList<Double> {
	@Override
    public String toString() {
		String s = "";
		for (int i = 0; i < this.size(); i++) {
			s = s + Const.decimalFormat.format(this.get(i)) + " ";
		}
        return s;
    }
}
