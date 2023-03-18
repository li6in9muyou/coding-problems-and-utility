for input in ./test/input-*.txt; do
  expected=$(head -n 1 "$input" | cut -d' ' -f 2 | tr -d '\r\n')
  actual=$(sed '1d' "$input"| python3 main.py | tr -d '\r\n')
  if [[ $expected -eq $actual ]]; then
    echo PASS
  else
    echo FAILED "$input" expected "$expected" actual "$actual"
  fi
done