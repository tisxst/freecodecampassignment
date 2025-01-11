#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE_TABLE=$($PSQL "TRUNCATE teams, games")
echo $TRUNCATE_TABLE

INSERT_TO_TEAMS() {
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$1')")
  if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into teams: $1
  fi
}

GET_TEAM_ID() {
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  echo $TEAM_ID
}

INSERT_TO_GAMES() {
  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($1, '$2', $3, $4, $5, $6)")
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into games: year $1
  fi
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # Get ID of winner and opponent
    WINNER_ID=$(GET_TEAM_ID "$WINNER")
    OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")

    # If not found
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TO_TEAMS "$WINNER"
    fi

    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_TO_TEAMS "$OPPONENT"
    fi

    # Get new winner and opponent ID
    WINNER_ID=$(GET_TEAM_ID "$WINNER")
    OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")

    # Insert rows to games
    INSERT_TO_GAMES $YEAR "$ROUND" $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
  fi
done
