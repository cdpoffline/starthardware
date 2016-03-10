#!/usr/bin/python

import re
import sys

file_name = sys.argv[1]

if "starthardware.org" not in file_name:
    exit(1)

pattern = re.compile("(\"http://(starthardware\\.org[^# \"]*))")
add = "\"" + "../" * file_name[file_name.rfind("starthardware.org"):].count("/")

with open(file_name, 'rb') as file:
    lines = file.readlines()

with open(file_name, "wb") as file:
    for line in lines:
        for match, path in pattern.findall(line):
            print(match[1:])
            line = line.replace(match, add + path)
        file.write(line)




