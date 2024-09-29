#!/bin/bash

#Variable a represents my total amount of money
a=10000
# Authentication code
correct_code="9682"
read -s -p "Enter a 4-digit authentication code: " user_code

#USE for loop to display asterisks for each character in the user_code
#changed the for loop to iterate over the length of the user_code using a C-style syntax: for (( i=0; i<${#user_code}; i++ )).
#for (( i=0; i<${#user_code}; i++ )) initializes a loop where i starts at 0 and increments by 1 until it reaches the length of user_code (denoted by ${#user_code}).
#the semicolon ; is used as a statement terminator. It allows you to separate multiple commands on a single line.
# Display asterisks for each character in the user_code on the same line
for (( i=0; i<${#user_code}; i++ )); do
#The printf function in the script is used for formatted output
#printf gives you more control over formatting if needed.
    printf "*"
done

# Add a condition an if statement to check authentication code
if [ "$user_code" == "$correct_code" ]; then
    echo " "
    echo "Authentication code is valid. Welcome!"
	while true
		do
  		echo "1. Withdraw cash"
  		echo "2. Insert cash"
  		echo "3. Exit Menu"
  		read -p "Enter your choice: " choice
  
#Case statement is used for simplifying multiple condition check with multiple different choices
  		case $choice in
      		1) echo "how mach cash you want to Withdraw"
#Variable b represents amount of money i want to withdraw
      		read -p "Enter Number: " b
#Added a condition an if statement to prevents negative balances and properly formatted to avoid any issues when running it
      	 	if (( b > a )); then
      	 		echo "error can't execute the Withdraw. You only have $a dollars."
      	 	else
        		a=$(( a - b ))
        		echo "You withdrew $b dollars."
        		echo "You now have $a dollars."
      		fi
		;;
     		2) echo "how mach cash you want to Insert"
#Variable b represents amount of money i want to insert
		read -p "Enter Number: " b
		a=$(( a + b ))
      		echo "You inserted $b dollars."
      		echo "You now have $a dollars."
		;;
     		3) echo "exit the system bye"
      		exit
        	 ;;

  		esac
	done
else
    echo " "
    echo "Invalid authentication code. Session ended."
fi
