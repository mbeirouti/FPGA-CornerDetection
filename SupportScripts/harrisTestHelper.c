#include <stdlib.h>
#include <math.h>
#include <stdio.h>



int main () {

	int gtrdn;
	int array[3];
	int out;
	while (1){

		for(gtrdn = 0; gtrdn < 3; gtrdn++){

			int in;
			scanf(" %x",&in);

			if (in == 0x999){
				return 0;
			}

			array[gtrdn] = in;
		}

		int gx, gy, gxy;

		gx = array[0];
		gy = array[1];
		gxy  = array[2];

		out = (gx*gy) - (gxy*gxy) - ((gx-gy)*(gx-gy))/25 ;

		//array[0]*array[1] - (array[3]*array[3]) - ((array[0]-array[1])*(array[0]-array[1]))*(1.0/25);

		// if (out > 255){
		// 	out = 255;
		// } else if(out < 0) {
		// 	out = 0;
		// }

		printf("Output Value:\t%x\n\n", out);

	}

}

