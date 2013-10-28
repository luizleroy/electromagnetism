package com.google.code.optimization;

import java.util.Date;

import com.google.code.optimization.functions.MinimizationWeightSpeed;
import com.google.code.optimization.pso.PSO;

/**
 * Hello world!
 * 
 */
public class App {
	public static void main(String[] args) {
		if (args.length == 0) {
			Date initial = new Date();
			System.out.println(initial);
			PSO.psoEXE();
			Date terminal = new Date();
			System.out.println(terminal);
			long time = terminal.getTime() - initial.getTime();
			if (time < 1001) { // 1s is good...
			System.out.println(time + " ms");
			} else {
				System.err.print(time + " ms");
			}
		} else {
			MinimizationWeightSpeed f = new MinimizationWeightSpeed();
			f.write();
		}
	}
}
