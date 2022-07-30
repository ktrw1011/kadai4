#!/bin/bash

# 最大公約数を計算するシェルスクリプト

# 数値判定
eval_number() {
	expr $1 + 1 >& /dev/null
}

# ユークリッドの互除法
compute() {
	a=$1
	b=$2
	
	r=$(expr $a % $b)
	
	while [ ! $r = 0 ]
	do
		a=$b
		b=$r
		r=$(expr $a % $b)
	done
	
	echo $b
}

# 引数チェック
# 引数は2つかどうか
if [[ ! $# = 2 ]]; then
    echo "[ERROR]: Arguments must be two integer."
    exit 1
fi

# 引数が0以上の数値かどうか
for arg in $@
do
	eval_number $arg
	if [[ ! $? -lt 2 ]]; then
		echo "[ERROR]: Arguments must be two integer."
		exit 1
	elif [[ $arg -lt 1 ]]; then
		echo "[ERROR]: Arguments must be positive integer."
		exit 1
	#"elif [ $arg = 0 ]; then
		#"echo "[ERROR]: Zero is not allowed."
		#exit 1
	fi
done

compute $1 $2
