# Password Policy Enforcer

#Made By - Aarsh Joshi
           Darshan Bari
           Samarth Hannure
           Homesh Ingle

A bash-based password strength checker that validates passwords against multiple security policies. Built this for a Linux systems project.

## What it does

Basically checks if your password is strong enough by running it through different security checks:

- **Username check** - makes sure you're not using your username in the password (bad idea)
- **Case sensitivity** - needs both upper and lowercase letters
- **Length & complexity** - minimum 8 chars, must have numbers and special characters
- **Password history** - prevents reusing old passwords
- **Common passwords** - checks against a dictionary of commonly used passwords

Then it gives you a score out of 100 and tells you if your password is secure or not.

## How to run

Just clone this repo and run the main script:

```bash
git clone https://github.com/Aazhs/password_policy_enforcer.git
cd password_policy_enforcer
bash 01_main_menu.sh
```

The script will handle making everything executable automatically.
