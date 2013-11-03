package com.google.code.optimization;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.OptionBuilder;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.PosixParser;

import com.google.code.optimization.ga.GA;

public class App {
	static String help = "Create Help!";

	public static void main(String[] args) {
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
		try {
			// parse the command line arguments
			CommandLine line = parser.parse(options, args);
			Const.dim = Integer.parseInt(line.getOptionValue("dims"));
			Const.nPoint = Integer.parseInt(line.getOptionValue("dots"));
			Const.iLoop = Integer.parseInt(line.getOptionValue("dots"));
			if (line.hasOption("_opt")) {
				Const.sFun = line.getOptionValue("_opt");
				GA.ga();
			}
			if (line.hasOption("_inp")) {
				throw new RuntimeException("não finalizado: lembrar de métodos write!!!");
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
	}

	// System.out.println(initial);
	// System.out.println("Helo Java 7!");
	// System.out.println();
	// if (args.length != 0) {
	// switch (args[0]) {
	// case "-o":
	// optimization(args);
	// break;
	// case "-w":
	// System.out.println("MinimizationWeightSpeed f = new MinimizationWeightSpeed(); f.write();");
	// break;
	// default:
	// System.err.print(help);
	// break;
	// }
	// } else {
	// System.err.print(help);
	// }
	// Date terminal = new Date();
	// System.out.println(terminal);

	private static void optimization(String[] args) {
		// String optimization = args[1];

		// switch (optimization) {
		// case METODO DE OTIMIZACAO
		// }
	}
}

// TO TEST MODULE (VIA JTEST JUNIT ETC.)
// FIXME criar, após estabilização, testes via maven
// TO TEST: 4 create files validation...
// TODO criar testes com funções baseado em arquivos de outros alunos