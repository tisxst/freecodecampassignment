PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
  # output without any parameter
  echo Please provide an element as an argument.
else
  # search for element
  if [[ $1 =~ ^[0-9]$ ]]
  then
    ELE_QUERY=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")
  fi
  # if atomic_number doesn't exist, try name
  if [[ -z $ELE_QUERY ]]
  then
    ELE_QUERY=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1';")
  fi
  # if name doesn't exist, try symbol
  if [[ -z $ELE_QUERY ]]
  then
    ELE_QUERY=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1';")
  fi
  # if element found
  if [[ -z $ELE_QUERY ]]
  then
    echo I could not find that element in the database.
  else
    echo "$ELE_QUERY" | while read TYPE_ID BAR A_NO BAR MASS BAR M_P BAR B_P BAR SB BAR A_NAME BAR TYPE
    do
      echo "The element with atomic number $A_NO is $A_NAME ($SB). It's a $TYPE, with a mass of $MASS amu. $A_NAME has a melting point of $M_P celsius and a boiling point of $B_P celsius."
    done
  fi
fi
