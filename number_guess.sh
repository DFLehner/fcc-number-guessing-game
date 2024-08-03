#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=user_data -t --no-align -c"

#Number guessing game: User tries to guess a randomly generated number from 1 to 1000.
#The username, number of games played, and highscore are then recorded into a PostgreSQL database.


#Check if returning user:

echo 'Enter your username:'

read username

query="SELECT username FROM players WHERE username = '$username';"

result=$($PSQL "SELECT username FROM players WHERE username = '$username';")
games_played=$($PSQL "SELECT games_played FROM players WHERE username = '$username';")
best_game=$($PSQL "SELECT best_game FROM players WHERE username = '$username';")

if [[ -z $result ]]; then
  new_user=$($PSQL "INSERT INTO players (username, games_played, best_game) VALUES ('$username',0,2000);")
  echo "Welcome, $username! It looks like this is your first time here."
  games_played=0
  best_game=1000
else
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

#Run the number guessing game:

echo "Guess the secret number between 1 and 1000:"
random_number=$(( ( RANDOM % 1000 ) + 1 ))

read userguess

while ! [[ $userguess =~ ^[0-9]+$ ]]; do
  echo "That is not an integer, guess again:"
  read userguess
done



guesscount=1

while [ "$userguess" != "$random_number" ]
do
    if [ "$userguess" -gt "$random_number" ]; then
      echo "It's lower than that, guess again:"
    else 
      echo "It's higher than that, guess again:"
    fi
    read userguess

    while ! [[ $userguess =~ ^[0-9]+$ ]]; do
    echo 'That is not an integer, guess again:'
    read userguess
    done

    ((guesscount++))   
done
echo "You guessed it in $guesscount tries. The secret number was $random_number. Nice job!"

#Save result to database:

if [ "$guesscount" -lt "$best_game" ]; then
  best_game=$guesscount
fi

((games_played++))

finish=$($PSQL "UPDATE players SET games_played = '$games_played', best_game = '$best_game' WHERE username = '$username';")

