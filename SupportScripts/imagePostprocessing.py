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

image = Image.new("L",(800,600))

for i in range(800):
	print("Column {} of {}".format(i,800))
	for j in range(600):
		image.putpixel((i,j),int.from_bytes(file.read(1),byteorder="little"))

file.close()
		
image.save("reconstructed.jpg")


