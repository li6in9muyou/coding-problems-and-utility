for input in ./test/*.in; do
  output=$(/usr/bin/time -p -f "%e" timeout 1.5 python3 main.py 2>&1 < "$input")
  status="$?"
  elapsed="$(echo "$output" | tail -n 1)s"
  actual=$(echo "$output" | head -n 1)
  case "$status" in
    124)
      echo TLE "$elapsed" "$input"
      ;;
    *)
      if diff -u --color \
        --label actual <(echo "$actual") \
        --label expected "${input/in/out}"; then
        echo PASS "$elapsed" "$input"
      else
        echo FAILED "$input"
      fi
      ;;
  esac
done