#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=user_data -t --no-align -c"

#Number guessing game: User tries to guess a randomly generated number from 1 to 1000.
#The username, number of games played, and highscore are then recorded into a PostgreSQL database.

echo 'Enter your username:'

read username

query="SELECT username FROM players WHERE username = '$username';"

result=$($PSQL "SELECT username FROM players WHERE username = '$username';")
games_played=$($PSQL "SELECT games_played FROM players WHERE username = '$username';")
best_game=$($PSQL "SELECT best_game FROM players WHERE username = '$username';")

if [[ -z $result ]]; then
  echo "Welcome, $username! It looks like this is your first time here."
else
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo "Guess the secret number between 1 and 1000:"
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