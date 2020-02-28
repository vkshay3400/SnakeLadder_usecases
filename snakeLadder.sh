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
currentposition=0
flag=0
player1=0
player2=0

# FUNCTION FOR SNAKE
function snake(){
	position=$1
	position=$(($position-$randomDice))
	if (( $1 < $START_POSITION ))
	then
		position=$START_POSITION
	fi
	if (( $position < $WIN_POSITION ))
	then
		currentposition=$position
	fi
}

# FUNCTION FOR LADDER
function ladder(){
	position=$1
	position=$(($position+$randomDice))
	if (( $position > $WIN_POSITION ))
	then
		position=$currentposition
		currentposition=$position
	fi
}

# CASE STATEMENTS FOR CHECKING CONDITION
function players(){
# GET RANDOM FOR DICE
randomDice=$((1+RANDOM%6))
randomCase=$((1+RANDOM%3))

case $randomCase in
		$NO_PLAY)
			position=$position
			echo "SamePosition : $position"
		;;
		$LADDER)
			ladder $position
			echo "Ladder +$randomDice : $position"
		;;
		*)
			snake $position
			echo "Snake -$randomDice : $position"
		;;
esac
}

# To CHECK WIN POSITION
function winPosition(){
while [[ $position -ne $WIN_POSITION ]]
do
	playerSwitch
done
}

# TO SWITCH PLAYER
function playerSwitch(){
if [ $flag -eq 0 ]
then
	position=$player1
	players
	player1=$position
	flag=1
else
	position=$player2
	players
	player2=$position
	flag=0
fi
}

# TO CHECK WHO WINS FIRST
function checkWin(){
	if [ $player1 -eq 100 ]
	then
		echo "Player1 wins"
	else
		echo "Player2 wins"
	fi
}

# TO CALL FUNCTION
winPosition
checkWin
