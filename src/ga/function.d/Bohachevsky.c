const size_t N = 10;
double function(vector<double> x) {
	cout << "I'am Bohachevsky..." << endl;
	//cout << "My x.size (5 or 10): " << (size_t) x.size() << endl;
	double target = 0;
	for (size_t i=0; i < N-1; i++) {
		double xi = x[i];
		double xii = x[i+1];
		double xxi = xi*xi; //x²
		double xxii = xii*xii; //(xi+1)²
		target += xxi + 2 * xxii - 0.3 * cos(3 * PI * xi) - 0.4 * cos(4 * PI * xii) + 0.7;
	}
	return target;
}


