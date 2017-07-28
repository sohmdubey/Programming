import time
from random import randint
play = "Yes"
print("Hello")
time.sleep(2)
print("Welcome to the Number Guessing Game")
time.sleep(2)
print("Find the number that the computer has chosen")
comp = randint(1, 100)
time.sleep(2)
#print(comp)
while play in ["Yes", "yes", "YES"]:
    user = int(input("Guess a number from 1 to 100: "))
    time.sleep(2)
    while comp != user:
        if comp > user:
            print("Try a higher number")
        else:
            print("Try a lower number")
        time.sleep(2)
        user = int(input("Guess another number: "))
    time.sleep(2)
    print("You won!")
    time.sleep(2)
    print("Thank you for playing")
    time.sleep(2)
    play = input("Would  you like to play again?: ")
    time.sleep(2)
print("We hope you enjoyed The Number Guessing Game")
print("Thank you again for playing")