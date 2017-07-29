#!/bin/bash

sort -nr $1 | head -${2:-10}
