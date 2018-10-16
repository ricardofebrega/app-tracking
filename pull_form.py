#!/usr/bin/env python
import sys
import nibabel
import json
img = nibabel.load(sys.argv[1])
out={"sform": img.header.get_sform().tolist(), "qform": img.header.get_qform().tolist()}
print json.dumps(out)

