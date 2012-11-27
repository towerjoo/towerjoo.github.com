# coding: utf-8
from optparse import OptionParser
import os, sys
from datetime import datetime


skeleton = """%s

## 参考资料
%s

%s
"""

parser = OptionParser()
parser.add_option("-p", "--path", dest="path", help="Path to the markdown file to add reference")

(options, args) = parser.parse_args()

def get_marks(cont):
    import re
    rx = re.compile(r"(\[[^]]+\])(\[[^]]+\])")
    matches = rx.findall(cont)
    ret = {}
    for match in matches:
        ret.update({match[0] : match[1]})
    return ret

def append_link(cont):
    import re
    rx = re.compile(r"(\[[^]]+\])")
    out = rx.sub(r"\1\1", cont)
    return out
    

if options.path:
    print "Add Reference Starts ..."
    fpath = options.path
    fh = open(fpath, "r")
    cont = fh.read()
    fh.close()
    cont = append_link(cont)
    matches = get_marks(cont)
    references = ""
    count = 1
    for key, value in matches.iteritems():
        references += "%d. %s%s\n" % (count, key, value)
        count += 1
    
    links = ""
    values = matches.values()
    for value in values:
        links += "%s:\n" % value
    after = skeleton % (cont, references, links)
    fh = open(fpath, "w")
    fh.write(after)
    fh.close()
    print "Add Reference Done."

else:
    parser.print_help()
