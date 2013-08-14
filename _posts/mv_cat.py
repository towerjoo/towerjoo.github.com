import re
import os, sys
import shutil

ROOT = os.path.abspath(os.path.dirname(__file__))
TO = "/home/tower/work/10000-hours.github.io/_posts/"
cat = "tech"
for f in os.listdir(ROOT):
    if f.endswith('py'):
        continue
    fh = open(f)
    cont = fh.read()
    fh.close()
    matches = re.findall("category:[ ]*%s" % cat, cont)
    if len(matches) > 0:
        print "%s is moved ..." % f
        shutil.move(os.path.join(ROOT, f), TO)



