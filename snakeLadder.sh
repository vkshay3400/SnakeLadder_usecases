#!/bin/bash -x

echo "*************************Snake and Ladder************************"

# CONSTANTS
COUNT=0
NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POSITION=100
START_POSITION=0

# VARIABLE
position=0
currentposition=$position

# FUNCTION FOR SNAKE
function snake(){
	position=$1
	position=$(($1-$randomDice))
	if (( $1 < $START_POSITION ))
	then
		position=$START_POSITION
	fi
	if (( $position < $WIN_POSITION ))
	then
		currentposition=$1
	fi
}

# FUNCTION FOR LADDER
function ladder(){
	position=$1
	position=$(($1+$randomDice))
	if (( $1 > $WIN_POSITION ))
	then
		position=$currentposition
		currentposition=$position
	fi
}

# CASE STATEMENTS FOR CHECKING CONDITION
function players(){
while [[ $position -ne $WIN_POSITION ]]
do
# GET RANDOM FOR DICE
randomDice=$((1+RANDOM%6))
randomCase=$((1+RANDOM%3))

case $randomCase in
		$NO_PLAY)
			position=$position
			echo SamePosition : $position
		;;
		$LADDER)
			ladder $position
			echo "Ladder +$randomDice : $position"
		;;
		*)
			snake $position
			echo Snake -$randomDice : $position
		;;
esac
(( COUNT++ ))
done
}

# TO PRINT PLAYERS
players
echo "Times of dice played: $COUNT"
