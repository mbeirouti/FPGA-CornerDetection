#include <stdlib.h>
#include <math.h>
#include <stdio.h>



int main () {

	int gtrdn;
	int array[9];
	int out;
	while (1){

		for(gtrdn = 0; gtrdn < 9; gtrdn++){

			int in;
			scanf(" %x",&in);

			if (in == 0x999){
				return 0;
			}

			array[gtrdn] = in;
		}

		out = array[0] + 2*array[1] + array[2] + 2*array[3] + 4*array[4] + 2*array[5] + array[6] + 2*array[7] + array[8];
		out = out / 16;

		if (out > 255){
			out = 255;
		} else if(out < 0) {
			out = 0;
		}

		printf("Output Value:\t%x\n\n", out);

	}

}

