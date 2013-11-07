package com.google.code.optimization;

import java.text.DecimalFormat;
import java.util.Date;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.OptionBuilder;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.PosixParser;

import com.google.code.optimization.ga.GA;
import com.google.code.optimization.pso.PSO;

public class App {
	static String help = "Create Help!";

	// TO TEST MODULE (VIA JTEST JUNIT ETC.)
	// FIXME criar, após estabilização, testes via maven
	public static void main(String[] args) {
		System.out.print(new Date().toLocaleString() + "\t");
		// create the Options
		Options options = new Options();
		options.addOption(OptionBuilder.withLongOpt("_inp")
				.withDescription("use FUNc-String for function definition")
				.hasArg().withArgName("FUNc").create());
		options.addOption(OptionBuilder.withLongOpt("_opt")
				.withDescription("use FUNc-String for function definition")
				.hasArg().withArgName("FUNc").create());
		options.addOption(OptionBuilder.withLongOpt("dims")
				.withDescription("use DIMs-Integer dimensions").hasArg()
				.withArgName("DIMs").create());
		options.addOption(OptionBuilder.withLongOpt("loop")
				.withDescription("use LOOp-Integer for kernel of algoritms")
				.hasArg().withArgName("LOOp").create());
		options.addOption(OptionBuilder.withLongOpt("dots")
				.withDescription("use DOTs-Integer for number of points")
				.hasArg().withArgName("DOTs").create());
		// create the command line parser
		CommandLineParser parser = new PosixParser();
		String gambiarra = "EROR ERROR ERROR";
		try {
			// parse the command line arguments
			CommandLine line = parser.parse(options, args);
			if (line.hasOption("_opt")) {
				Const.dims = Integer.parseInt(line.getOptionValue("dims"));
				Const.dots = Integer.parseInt(line.getOptionValue("dots"));
				Const.loop = Integer.parseInt(line.getOptionValue("loop"));
				Const.sFun = line.getOptionValue("_opt");
				System.out.print(Const.sFun + "\t" + Const.dims + "\t");
				
				gambiarra = "PSO";
				System.out.print(gambiarra+"\t");

				System.out.print(Const.loop + "\t" + Const.numTest + "\t"
						+ Const.dots + "\t");
				double[] result = { 0., 0., 0. };
				for (int i = 0; i < Const.numTest; i++) {
//					double[] parcialResult = GA.ga();
					double[] parcialResult = PSO.pso();
					result[0] += parcialResult[0];
					result[1] += parcialResult[1];
					result[2] += parcialResult[2];
				}
				
				DecimalFormat integerFormat = new DecimalFormat("0");
				DecimalFormat engFormat = new DecimalFormat("0.000#E0");
				System.out.print(integerFormat.format(result[0] / Const.numTest) + "\t");
				System.out.print(integerFormat.format(result[1] / Const.numTest) + "\t");
				System.out.print(engFormat.format(result[2] / Const.numTest) + "\t");
			}
			if (line.hasOption("_inp")) {
				throw new RuntimeException(
						"não finalizado: lembrar de métodos write!!!");
			}
		} catch (ParseException exp) {
			System.out.println("Unexpected exception:" + exp.getMessage());
			// automatically generate the help statement
			HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp(App.class.getName(), options);
		} catch (NumberFormatException exp) {
			System.out.println("Unexpected exception (ERROR USER):"
					+ exp.getMessage());
			// automatically generate the help statement
			HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp(App.class.getName(), options);
		}
		System.out.println();
		System.out.println();
		System.out.println(new Date());
		System.out.println("-----------------------------");
		System.out.println("That's all folks, " + (gambiarra) + "!");
		System.out.println("-----------------------------");
		System.exit(0);
	}
}