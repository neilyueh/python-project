import random
import PIL

# sudo apt-get install python-imaging
from PIL import Image as Image
from PIL import ImageFont
from PIL import ImageDraw
from PIL import ImageFilter


def gen_captcha(text, fnt, fnt_sz, file_name, fmt='JPEG'):
	"""Generate a captcha image"""
	# randomly select the foreground color
	fgcolor = random.randint(0,0xffff00)
	# make the background color the opposite of fgcolor
	bgcolor = fgcolor ^ 0xffffff
	# create a font object
	font = ImageFont.truetype(fnt,fnt_sz)
	# determine dimensions of the text
	dim = font.getsize(text)
	# create a new image slightly larger that the text
	im = PIL.Image.new('RGB', (dim[0]+100,dim[1]+80), bgcolor)
	d = ImageDraw.Draw(im)
	x, y = im.size
	r = random.randint
	# draw 100 random colored boxes on the background
	for num in range(100):
		d.rectangle((r(0,x),r(0,y),r(0,x),r(0,y)),fill=r(0,0xffffff))

	# add the text to the image
	d.text((0,0), text, font=font, fill=fgcolor)
	im = im.filter(ImageFilter.EDGE_ENHANCE_MORE)
	# save the image to a file
	im.save(file_name, format=fmt)

def generate_it():
    words = open('words.txt').readlines()
    word = words[random.randint(1,len(words))-2]
    s=word.strip()
    if(len(s)<2):
        s=word.strip()
    #
    gen_captcha(s, 'PORKYS_.TTF', 200, "test.jpg")


if __name__ == '__main__':
    import os
    print(os.getcwd())
    generate_it()
