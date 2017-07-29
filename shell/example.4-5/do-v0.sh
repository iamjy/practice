#!/bin/bash

fieldname=$1
filename=$2
cut -f${fieldname} -d\| ${filename}
