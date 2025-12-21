# Password Policy Enforcer

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

## Usage

When you run it, you'll get a menu like this:

```
==========================================
    PASSWORD POLICY ENFORCER PROJECT      
==========================================
Please enter your details to test:
Enter Username: john
Enter Password: ********

------------------------------------------
Select a Policy Module to Run:
1. Username Containment & Case Sensitivity Check
2. Length, Special Char & Number Check
3. Password History Check
4. Common Password Dictionary Check
5. Generate Password Strength Score
6. Run ALL Checks
7. Exit
------------------------------------------
Enter choice [1-7]:
```

You can test individual checks or run all of them at once (option 6).

## Files

- `01_main_menu.sh` - main menu interface
- `02_check_user_case.sh` - username & case checks
- `03_check_complexity.sh` - length, numbers, special chars
- `04_check_history.sh` - password history validation
- `05_check_common.sh` - dictionary attack prevention
- `06_score_gen.sh` - calculates overall strength score
- `common_pass.txt` - list of common passwords to check against
- `password_history.txt` - stores password history (auto-generated)

## Example

```bash
# Testing a weak password
Username: alice
Password: password123

Result: 
[FAIL] Password is too common (found in dictionary).
FINAL SCORE: 45 / 100
Rating: WEAK (Vulnerable)

# Testing a strong password
Username: alice  
Password: MyS3cur3P@ssw0rd!

Result:
[PASS] All checks passed
FINAL SCORE: 100 / 100
Rating: EXCELLENT (Secure)
```

## Notes

- The password history file gets created automatically on first run
- Common passwords list can be expanded by adding more entries to `common_pass.txt`
- Scoring system: each check is worth a certain number of points, max 100

## Requirements

Just bash - should work on any Linux/Unix system or macOS.

## Future improvements

Maybe add:
- Entropy calculation
- Minimum password age
- Account lockout after failed attempts
- Better UI with colors

Feel free to fork and improve!
