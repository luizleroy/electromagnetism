const size_t N = 10;
double function(vector<double> x) {
	cout << "I'am Rastrigin..." << endl;
	//cout << "My x.size (5 or 10): " << (size_t) x.size() << endl;
	const size_t n = x.size(); //5 or 10
	double target = 10*n;
	for (size_t i=0; i<n; i++) {
		double xi = x[i];
		double xx = xi*xi; //x²
		target = target + xx - 10 * cos(2 * PI * xi);
	}
	return target;
}
