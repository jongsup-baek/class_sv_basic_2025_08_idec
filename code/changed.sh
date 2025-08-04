#!/bin/bash

for file in ex[0-9]*_*; do
  # 숫자 부분 추출
  number=$(echo "$file" | sed -E 's/^ex([0-9]+)_.*$/\1/')
  padded=$(printf "%02d" "$number")

  # 나머지 부분 추출 (number 이후 전체)
  rest=$(echo "$file" | sed -E 's/^ex[0-9]+_//')

  # 이미 페이즈가 있는지 확인 (ex4_1_test.sv 등)
  if echo "$rest" | grep -q '^[0-9]+_'; then
    # exN_M_* 형식 → exNN_M_*
    newname="ex${padded}_${rest}"
  elif echo "$file" | grep -q "^ex${padded}_0_"; then
    # 이미 원하는 형식이면 skip
    echo "Skipping already formatted: $file"
    continue
  else
    # exN_* 형식 → exNN_0_*
    newname="ex${padded}_0_${rest}"
  fi

  echo "Renaming: $file -> $newname"
  mv "$file" "$newname"
done

