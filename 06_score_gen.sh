#!/bin/bash

# Password Strength Score Generator
# runs all checks and calculates final score

USERNAME=$1
PASSWORD=$2
SCORE=0
MAX_SCORE=100

echo "----------------------------------------"
echo "CALCULATING STRENGTH SCORE..."
echo "----------------------------------------"

# username & case checks
OUTPUT_02=$(./02_check_user_case.sh "$USERNAME" "$PASSWORD")
if echo "$OUTPUT_02" | grep -q "Password does not contain the username."; then
  echo " [+] Username Containment Check: PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] Username Containment Check: FAILED (+0 pts)"
fi

if echo "$OUTPUT_02" | grep -q "Password contains both uppercase and lowercase letters."; then
  echo " [+] Mixed Case Check:           PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] Mixed Case Check:           FAILED (+0 pts)"
fi

# complexity checks (length, numbers, special chars)
OUTPUT_03=$(./03_check_complexity.sh "$PASSWORD")
if echo "$OUTPUT_03" | grep -q "Password length is valid."; then
  echo " [+] Length Check:               PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] Length Check:               FAILED (+0 pts)"
fi

if echo "$OUTPUT_03" | grep -q "Password contains a number."; then
  echo " [+] Number Check:               PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] Number Check:               FAILED (+0 pts)"
fi

if echo "$OUTPUT_03" | grep -q "Password contains a special character."; then
  echo " [+] Special Character Check:    PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] Special Character Check:    FAILED (+0 pts)"
fi

# history check
OUTPUT_04=$(./04_check_history.sh "$USERNAME" "$PASSWORD")
if echo "$OUTPUT_04" | grep -q "Password is new."; then
  echo " [+] History Check:              PASSED (+15 pts)"
  SCORE=$((SCORE + 15))
else
  echo " [-] History Check:              FAILED (+0 pts)"
fi

# common password dictionary check
OUTPUT_05=$(./05_check_common.sh "$PASSWORD")
if echo "$OUTPUT_05" | grep -q "Password is not in the common dictionary."; then
  echo " [+] Common Password Check:      PASSED (+10 pts)"
  SCORE=$((SCORE + 10))
else
  echo " [-] Common Password Check:      FAILED (+0 pts)"
fi

echo "----------------------------------------"
echo "FINAL SCORE: $SCORE / $MAX_SCORE"
echo "----------------------------------------"

# determine rating based on score
if [ "$SCORE" -ge 90 ]; then
  echo "Rating: EXCELLENT (Secure)"
elif [ "$SCORE" -ge 60 ]; then
  echo "Rating: MODERATE (Needs Improvement)"
else
  echo "Rating: WEAK (Vulnerable)"
fi
