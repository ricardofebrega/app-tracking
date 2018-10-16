#!/usr/bin/env python

# feed the output from track_info and it will output in json object

import sys
import json

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

meta = {}

for line in sys.stdin:
    tokens = line.strip().split(":")
    if len(tokens) == 2:
        key=tokens[0].strip()
        value=tokens[1].strip()
        if is_number(value):
            value = float(value)
        if key in meta:
            #if there are more than 1 value, convert to array.. (very fragile?)
            if not isinstance(meta[key], list):
                meta[key] = [ meta[key] ]
            meta[key].append(value)
        else:
            meta[key] = value

print json.dumps(meta)
