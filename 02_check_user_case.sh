#!/bin/bash

# username check & case sensitivity check
USERNAME=$1
PASSWORD=$2

# Check if Username is inside Password (case insensitive)
if echo "$PASSWORD" | grep -iq "$USERNAME"; then
  echo "[FAIL] Password contains the username."
else
  echo "[PASS] Password does not contain the username."
fi

# Check for Mixed Case
# need both lowercase AND uppercase
if echo "$PASSWORD" | grep -q "[a-z]" && echo "$PASSWORD" | grep -q "[A-Z]"; then
  echo "[PASS] Password contains both uppercase and lowercase letters."
else
  echo "[FAIL] Password must contain mixed case letters."
fi
