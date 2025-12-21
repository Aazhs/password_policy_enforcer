#!/bin/bash

# complexity check - length, numbers, special chars
PASSWORD=$1
MIN_LEN=8

# Check Length
LEN=${#PASSWORD}
if [ "$LEN" -lt "$MIN_LEN" ]; then
  echo "[FAIL] Password is too short ($LEN chars). Min: $MIN_LEN."
else
  echo "[PASS] Password length is valid."
fi

# Check for Number
if echo "$PASSWORD" | grep -q "[0-9]"; then
  echo "[PASS] Password contains a number."
else
  echo "[FAIL] Password missing a number."
fi

# Check for Special Character (anything that's not alphanumeric)
if echo "$PASSWORD" | grep -q "[^a-zA-Z0-9]"; then
  echo "[PASS] Password contains a special character."
else
  echo "[FAIL] Password missing a special character."
fi
