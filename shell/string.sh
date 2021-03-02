#!/bin/sh

# Mimic Python substring:
#   substr "abcde"        # "abcde", same as python: "abcde"[:]
#   substr "abcde" 1      # "bcde",  same as python: "abcde"[1:]
#   substr "abcde" -1     # "e",     "abcde"[-1:]
#   substr "abcde" 1 5    # "bcde",  "abcde"[1:5]
#   substr "abcde" -5 -1  # "abcd",  "abcde"[-5:-1]
substr() {
	awk -v s="$1" -v start="$2:-0" -v stop="${3:-${#1}}" 'BEGIN{
		if (start < 0) { start = length(s) + start + 1; } else { start += 1; }
		if (stop < 0) { stop = length(s) + stop + 1; } else { stop += 1; }
		len = stop - start
		print substr(s, start, len)
	}'
}

# startswith string prefix
# return: true, if `string` start with `prefix`
startswith() {
	[ ${#2} -gt 0 -a "$2${1#${2}}" = "$1" ] && echo "true" || echo "false"
}


# endswith string suffix
# return: true, if `string` ends with `prefix`.
endswith() {
	[ ${#2} -gt 0 -a "${1%${2}}$2" = "$1" ] && echo "true" || echo "false"
}

# contains string substr
# return: true, if `string` contains `substr`.
contains() {
	[ ${#2} -gt 0 -a "${1#*${2}*}" != "$1" ] && echo "true" || echo "false"
}

# index string substr
# return: index of substr in string
#    index "abcde" "ab" # 1
#    index "abcde" "cd" # 3
# 	 index "abcde" "x"  # 0 , means not exist
index() {
	awk -v a="$1" -v b="$2" 'BEGIN{print index(a,b)}'
}

