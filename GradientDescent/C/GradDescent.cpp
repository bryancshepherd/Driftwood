// GradDescent.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

int main()
{
	std::cout << "Hello, world" << std::endl;

	std::vector<double> y;
	std::vector<double> x1;
	std::vector<double> x2;
	std::vector<double> x3;
	std::vector<double> x4;

	int rows = 1000;

	// Generate data
	for (int i = 0; i < rows; i++) {

		x1.push_back(rand() % 100);
		x2.push_back(rand() % 100);
		x3.push_back(rand() % 100);
		x4.push_back(rand() % 100);
		y.push_back(8.0 + x1[i] * 3.0 + x2[i] * 1.5 + x3[i] * .5 + x4[i] * .25);
		// printf("Y: %4.2f, X1: %4.2f, X2: %4.2f, X3: %4.2f, X4: %4.2f \n", y[i], x1[i], x2[i], x3[i], x4[i]);

	};

#if(1)
	// Estimate parameters with gradient decsent 
	int j = 1;
	double b0 = 0, b1 = 0, b2 = 0, b3 = 0, b4 = 0;

	while (j > 0) {

		std::vector<double> yhat;
		double alpha = .0001;

		double costb0 = 0, costb1 = 0, costb2 = 0, costb3 = 0, costb4 = 0;

		for (int k = 0; k < rows; k++) {
		 
			// yhat.push_back(b0 + x1[k] * b1 + x2[k] * b2 + x3[k] * b3 + x4[k] * b4);

			int init = 0;
			double betas[] = { b0, b1, b2, b3, b4 };
			double obs[] = { 1, x1[k], x2[k], x3[k], x4[k] };

			yhat.push_back(std::inner_product(betas, betas+5, obs, init));

			costb0 = costb0 + ((yhat[k] - y[k]) * 1.0);
			costb1 = costb1 + ((yhat[k] - y[k]) * x1[k]);
			costb2 = costb2 + ((yhat[k] - y[k]) * x2[k]);
			costb3 = costb3 + ((yhat[k] - y[k]) * x3[k]);
			costb4 = costb4 + ((yhat[k] - y[k]) * x4[k]);

			// printf("%4.2f \n", costb0);
		}

		double m = (1.0 / rows);
		double adjfac = alpha * m;

		b0 = b0 - (alpha * .05 * costb0);
		b1 = b1 - (adjfac * costb1);
		b2 = b2 - (adjfac * costb2);
		b3 = b3 - (adjfac * costb3);
		b4 = b4 - (adjfac * costb4);

		if (abs(costb0 * alpha) < .001 & abs(costb1 * adjfac) < .001 & abs(costb2 * adjfac) < .001 & abs(costb3 * adjfac) < .001 & abs(costb4 * adjfac) < .001) j = 0;

		printf("%4.2f %4.2f %4.2f %4.2f %4.2f \n", b0, b1, b2, b3, b4);

	}
#endif



    return 0;
}

