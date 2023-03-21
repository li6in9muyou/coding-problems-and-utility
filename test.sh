for input in ./test/input-*.txt; do
  expected=$(head -n 1 "$input" | cut -d' ' -f 2 | tr -d '\r\n')
  output=$(sed '1d' "$input"| time -p -f "%e" timeout 1.5 python3 main.py 2>&1)
  status="$?"
  actual=$(echo "$output" | head -n 1)

  case "$status" in
    124)
      echo TLE "$input"
      ;;
    *)
      if [[ $expected -eq  $actual ]]; then
        echo PASS "$(echo "$output" | tail -n 1)"s "$input"
      else
        echo FAILED "$input" expected "$expected" actual "$actual"
      fi
      ;;
  esac
done