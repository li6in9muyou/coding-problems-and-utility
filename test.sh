for input in $(ls ./input-*.txt); do
  expected=$(head -n 1 "$input" | cut -d' ' -f 2 | tr -d '\r\n')
  actual=$(cat "$input" | sed '1d' | python3 main.py | tr -d '\r\n')
  if [[ $expected -eq $actual ]]; then
    echo PASS
  else
    echo FAILED
  fi
done