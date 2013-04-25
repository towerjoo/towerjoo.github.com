import re
import os
import sys
import commands

def handle_cont(cont):
    matches = re.findall("(!binary \|\n[ ]+[^\n]+)", cont)
    flag = False
    for m in matches:
        rubycode = "require 'yaml';print YAML.load('%s')" % m
        cmd = """echo "%s"|ruby""" % rubycode
        flag, orig = commands.getstatusoutput(cmd)
        cont = cont.replace(m, orig)
        flag = True
    return flag, cont
        

for f in os.listdir(os.getcwd()):
    if f.endswith(".html"):
        fh = open(f)
        cont = fh.read()
        fh.close()
        flag, cont = handle_cont(cont)
        if flag:
            fh = open(f, "w")
            fh.write(cont)
            fh.close()

