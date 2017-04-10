#include <stdlib.h>
#include <math.h>
#include <stdio.h>



int main () {

	int gtrdn;
	int array[6];
	int out;
	while (1){

		for(gtrdn = 0; gtrdn < 6; gtrdn++){

			int in;
			scanf(" %x",&in);

			if (in == 0x999){
				return 0;
			}

			array[gtrdn] = in;
		}

		out = array[0] + 2*array[1] + array[2] - array[3] - 2*array[4] -array[5];

		if (out > 255){
			out = 255;
		} else if(out < 0) {
			out = 0;
		}

		printf("Output Value:\t%x\n\n", out);

	}

}

