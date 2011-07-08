#!/bin/bash
# Replace TAB with 4 spaces and delete triming blanks.

sed -i "s/\t/    /g" *
sed -i "s/\s\+$//g" *

