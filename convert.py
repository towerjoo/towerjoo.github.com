# coding: utf-8
import urllib, urllib2
import os
import re

DIR_NAME = "_posts"

def refine_file_names():
	"""Unquote the file names to make it understandable for non-English users
	"""
	for f in os.listdir(DIR_NAME):
		newname = urllib.unquote(f)

		os.rename(os.path.join(DIR_NAME, f),  os.path.join(DIR_NAME, newname))

def replace_image_path():
	"""Replace the image path to the *local* server instead of other server
	"""
	for f in os.listdir(DIR_NAME):
		print "working on %s" % f
		newname = os.path.join(DIR_NAME, urllib.unquote(f))
		rx = re.compile("""<a href="(http://towerjoo.blog.techweb.com.cn/files/[0-9]+/[0-9]+/[^"]+)"><img class="[^"]+" src="([^"]+)""")
		fh = open(newname)
		cont = fh.read()
		fh.close()
		matches = rx.findall(cont)
		newrx = re.compile("""<a href="http://towerjoo.blog.techweb.com.cn/files/[0-9]+/[0-9]+/[^"]+"><img class="[^"]+" src="([^"]+)""")
		for match in matches:
			name = match[0].split("/")[-1]
			repl = "/assets/images/%s" % name
			cont = re.sub(match[1], repl, cont) 
			cont = re.sub(match[0], repl, cont) 
		fh = open(newname, "w")
		fh.write(cont)
		fh.close()

if __name__ == "__main__":
	replace_image_path()
