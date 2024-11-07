#!/bin/bash -xv

ng () {
	echo ${1}行目が違うヨ
	res=1
}

res=0

out=$(seq 5 | ./plus)
++ seq 5
++ ./plus
+ out=15
[ "${out}" = 15 ] || ng "$LINENO"
+ '[' 15 = 15 ']'

[ "${res}" = 0 ] && echo OK
+ `[` 0 = 0 `]`
+ echo OK
OK
exit $res
+ exit 0

### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

