#!/bin/bash

# password history check - prevents reusing old passwords
USERNAME=$1
PASSWORD=$2
HISTORY_FILE="password_history.txt"

# create history file if it doesn't exist
if [ ! -f "$HISTORY_FILE" ]; then
  touch "$HISTORY_FILE"
fi

# hash the password using SHA-256
PASSWORD_HASH=$(echo -n "$PASSWORD" | sha256sum | awk '{print $1}')

# check if password hash exists in history for this user
# format: username:password_hash (one per line)
if grep -Fxq "$USERNAME:$PASSWORD_HASH" "$HISTORY_FILE"; then
  echo "[FAIL] You have used this password before."
else
  echo "[PASS] Password is new."
  # automatically add to history
  # in real scenario this would happen on actual password change
  echo "$USERNAME:$PASSWORD_HASH" >> "$HISTORY_FILE"
  echo "       (Added to password history)"
fi
