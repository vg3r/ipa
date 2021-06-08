import re
import subprocess
from sys import platform

cmd = ""
if platform == "win32":
    ints = subprocess.check_output(["ipconfig", "/all"])
else:
    ints = subprocess.check_output(["ifconfig", "-a"])

for i in ints.split('\n'):
    if re.match(r'^\w.*?:', i):
        a = re.match('^\w.*?:', i)
        print a.group()
    elif re.match('(.*(?:inet|IPv[46]\s).*)', i):
        b = re.match(r'(.*(?:inet|IPv[46]\s).*?\s.*?)\s', i)
        print re.sub('\t', '  ', b.group())
