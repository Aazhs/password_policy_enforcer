#!/bin/bash

# Main menu - password policy checker

# make sure all scripts are executable
chmod +x 02_check_user_case.sh 03_check_complexity.sh 04_check_history.sh 05_check_common.sh 06_score_gen.sh

while true; do
  echo "=========================================="
  echo "    PASSWORD POLICY ENFORCER PROJECT      "
  echo "=========================================="
  echo "Please enter your details to test:"
  read -p "Enter Username: " USERNAME
  read -s -p "Enter Password: " PASSWORD
  echo ""

  echo "------------------------------------------"
  echo "Select a Policy Module to Run:"
  echo "1. Username Containment & Case Sensitivity Check"
  echo "2. Length, Special Char & Number Check"
  echo "3. Password History Check"
  echo "4. Common Password Dictionary Check"
  echo "5. Generate Password Strength Score"
  echo "6. Run ALL Checks"
  echo "7. Exit"
  echo "------------------------------------------"
  read -p "Enter choice [1-7]: " choice

  case $choice in
    1) 
      ./02_check_user_case.sh "$USERNAME" "$PASSWORD" 
      ;;
    2) 
      ./03_check_complexity.sh "$PASSWORD" 
      ;;
    3) 
      ./04_check_history.sh "$USERNAME" "$PASSWORD" 
      ;;
    4) 
      ./05_check_common.sh "$PASSWORD" 
      ;;
    5) 
      ./06_score_gen.sh "$USERNAME" "$PASSWORD" 
      ;;
    6)
      echo "--- Running All Checks ---"
      ./02_check_user_case.sh "$USERNAME" "$PASSWORD"
      ./03_check_complexity.sh "$PASSWORD"
      ./04_check_history.sh "$USERNAME" "$PASSWORD"
      ./05_check_common.sh "$PASSWORD"
      ;;
    7)
      echo "Exiting..."
      exit 0
      ;;
    *) 
      echo "Invalid option. Please try again." 
      ;;
  esac

  echo ""
  read -p "Press Enter to continue..."
done
