from PIL import Image

"""
imagePostprocessing.py

Author: Marc Cataford

Rebuilds an image from the light-header/pixel matrix format used by the
Harris corner detector. Prompts the user for source file containing the
binary data as well as the output file format, which can be any format
supported by PIL.
"""

#Query for filename
filename = input("Filename: ")

#Query for the format
format = input("Format: ")

#Open file
file = open(filename,"rb")

print("Reading file...")

#Parse file header (upper 8 bytes, little endian) into width/height words.
width = int.from_bytes(file.read(4),byteorder="little")
height = int.from_bytes(file.read(4),byteorder="little")

#Create container for image
image = Image.new(mode="L",size=(width,height))

#Reconstructing the pixel matrix from bin file bytes.
for i in range(width):
	for j in range(height):
		pixel = int.from_bytes(file.read(1),byteorder="little")
		image.putpixel((i,j),pixel)
		
#Closing image stream
file.close()

targetFilename = "reconstructed.{}".format(format)

#Saving to final file.
image.save(targetFilename)

print("All done! Generated {}".format(targetFilename))


