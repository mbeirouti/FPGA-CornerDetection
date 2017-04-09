from PIL import Image
import struct

"""
imagePreprocessing.py

Author: Marc Cataford

Quick preprocessing routine to simplify the data processed by the FPGA.
This would be executed on the camera <-> FPGA interface so that only the
useful data is relayed along. It also cuts down on the parsing work done by
the testbench to feed the image to the processing unit.

The image is grayscaled so that each pixel is a byte, then its header is stripped
and replaced by a 2-line header describing the width and height of the image.
The following lines are the pixel data for the whole image.
"""

#Open the image file.
filename = input("Image file: ")

print("Reading file...")

#Convert to grayscale (colours not needed for edge detection).
imageSource = Image.open(filename).convert("L")

print("Source image grayscaled.")

#Loading pixel data
imageData = imageSource.load()

#Acquiring dimensions
imageWidth, imageHeight = imageSource.size

print("Building output binary file...")

#Preparing output file
outputFile = open("processedImageData.bin","wb")

#Simplified header
outputFile.write(struct.pack('i',imageWidth))
outputFile.write(struct.pack('i',imageHeight))

#Per pixel processing
for x in range(imageWidth):
	lineData = list()

	for y in range(imageHeight):

		#Normalize pixel to byte boundaries if necessary
		currentPixel = int(imageData[x,y])
		if currentPixel > 255:
			currentPixel = 255

		#Store pixel in the pixel matrix
		imageSource.putpixel((x,y),currentPixel)
		lineData.append(currentPixel)

	#Output to bin file
	outputFile.write(bytearray(lineData))

#Close bin file
outputFile.close()

#Output transformed image for validation
targetFilename = "out.{}".format(filename[len(filename)-3:len(filename)])
imageSource.save(targetFilename)

print("All done! Generated {}".format(targetFilename))