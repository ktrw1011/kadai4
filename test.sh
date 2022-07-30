#!/bin/bash

# エラーのテスト
# 引数が文字の場合
testStringArg() {
  output="$(./compute_gcd.sh a b)"
  assertEquals "${output}" "[ERROR]: Arguments must be two integer."
}


# 引数がない場合
testNullArg() {
  output="$(./compute_gcd.sh)"
  assertEquals "${output}" "[ERROR]: Arguments must be two integer."
}

# 引数が1つの場合
testOneArg() {
  output="$(./compute_gcd.sh 1)"
  assertEquals "${output}" "[ERROR]: Arguments must be two integer."
}

# 引数が多すぎる場合
testThreeArg() {
  output="$(./compute_gcd.sh 60 20 10)"
  assertEquals "${output}" "[ERROR]: Arguments must be two integer."
}

# 引数に0がある場合
testZeroArg() {
  output="$(./compute_gcd.sh 60 0)"
  assertEquals "${output}" "[ERROR]: Arguments must be positive integer."
}

# 引数にマイナスがある場合
testMinusArg() {
  output="$(./compute_gcd.sh 60 -1)"
  assertEquals "${output}" "[ERROR]: Arguments must be positive integer."
}

# 正常系のテスト
# 24と16
test24and16() {
  output="$(./compute_gcd.sh 24 16)"
  assertEquals "${output}" "8"
}

# 入れ替えても結果は同じ
test16and24() {
   output="$(./compute_gcd.sh 16 24)"
   assertEquals "${output}" "8"
}

test1and1() {
  output="$(./compute_gcd.sh 1 1)"
  assertEquals "${output}" "1"
}

. shunit2/shunit2
