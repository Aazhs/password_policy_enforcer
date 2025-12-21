#!/bin/bash

# password history check - prevents reusing old passwords
USERNAME=$1
PASSWORD=$2
HISTORY_FILE="password_history.txt"

# create history file if it doesn't exist
if [ ! -f "$HISTORY_FILE" ]; then
  touch "$HISTORY_FILE"
fi

# check if password exists in history for this user
# format: username:password (one per line)
if grep -Fxq "$USERNAME:$PASSWORD" "$HISTORY_FILE"; then
  echo "[FAIL] You have used this password before."
else
  echo "[PASS] Password is new."
  # automatically add to history
  # in real scenario this would happen on actual password change
  echo "$USERNAME:$PASSWORD" >> "$HISTORY_FILE"
  echo "       (Added to password history)"
fi
