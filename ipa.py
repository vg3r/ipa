#!/usr/bin/python

import re
import subprocess
import codecs
from sys import platform

if platform == "win32":
    ints = subprocess.check_output(["ipconfig","/all"])
    ints = codecs.decode(ints)
else:
    ints = subprocess.check_output(["ifconfig", "-a"])

for i in ints.split('\n'):
    if re.match(r'^\w[^\.]+?:', i):
        a = re.match('^\w[^\.]+?:', i)
        print(a.group())
    elif re.match('(.*(?:inet|IPv[46]\s).*)', i):
        b = re.match(r'(.*(?:inet|IPv[46]|.*.\ :).*?\s.*?)\s', i)
        print(b.group())
