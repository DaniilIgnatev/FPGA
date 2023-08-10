from PIL import Image

im = Image.open('input.bmp')

imageSizeW, imageSizeH = im.size
p = im.getpalette()

words_content = []

color_dict = {
    0: (0, 0, 0),
    8: (0, 0, 0),
    1: (0, 0, 1),
    9: (0, 0, 1),
    2: (0, 1, 0),
    10: (0, 1, 0),
    3: (0, 1, 1),
    11: (0, 1, 1),
    4: (1, 0, 0),
    12: (1, 0, 0),
    5: (1, 0, 1),
    13: (1, 0, 1),
    6: (1, 1, 0),
    14: (1, 1, 0),
    7: (1, 1, 1),
    15: (1, 1, 1)
}


for j in range(0, imageSizeH):
    for i in range(0, imageSizeW):
        pixVal = im.getpixel((i, j))
        color = color_dict[pixVal]
        r = color[2]
        g = color[1]
        b = color[0]
        byte = ((2**0) * r) + ((2**1) * g) + ((2**2) * b)
        words_content.append(byte)


lines = []
c = 0
for w in words_content:
    lines.append("  {0}   :   {1};\n".format(c, w))
    c += 1


with open('output.mif', 'w') as fo:
    fo.write("WIDTH=3;\n")
    fo.write("DEPTH=76800;\n")
    fo.write("\n")
    fo.write("ADDRESS_RADIX=UNS;\n")
    fo.write("DATA_RADIX=UNS;\n")
    fo.write("\n")
    fo.write("CONTENT BEGIN\n")
    fo.writelines(lines)
    fo.write("END;\n")
