#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

#Number guessing game: User tries to guess a randomly generated number from 1 to 1000.
#The username, number of games played, and highscore are then recorded into a PostgreSQL database.

echo 'Enter your username:'

read username


while IFS='|' read -r column1 column2; do
  echo "Column1: $column1, Column2: $column2"
done <<< "$result"

random_number=$(( ( RANDOM % 1000 ) + 1 ))

read userguess
guesscount=1

while [ "$userguess" != "$random_number" ]
do
    if [ "$userguess" -gt "$random_number" ]; then
      echo "It's lower than that, guess again:"
    else 
      echo "It's higher than that, guess again:"
    fi
    read userguess
    ((guesscount++))   
done
echo "You guessed it in $guesscount tries. The secret number was $random_number. Nice job!"