#!/bin/bash

# common password dictionary check
PASSWORD=$1
COMMON_FILE="common_pass.txt"

# check against dictionary of common passwords
if grep -Fxq "$PASSWORD" "$COMMON_FILE"; then
  echo "[FAIL] Password is too common (found in dictionary)."
else
  echo "[PASS] Password is not in the common dictionary."
fi
