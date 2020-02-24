#!/bin/bash -x

echo "*************************Snake and Ladder************************"

# FUNCTION FOR SNAKE
function snake(){
	position=$1
	position=$(($1-$random1))		
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
	position=$(($1+$random1))
	if (( $1 > $WIN_POSITION ))
	then
		position=$currentposition
		currentposition=$position
	fi
}

# CASE STATEMENTS FOR CHECKING CONDITION
function players(){
# CONSTANTS
WIN_POSITION=100
START_POSITION=0

# VARIABLE
position=0
currentposition=$position

while [[ $position -ne $WIN_POSITION ]]
do
random1=$((1+RANDOM%6))
random2=$((1+RANDOM%3))

case $random2 in
		1)
			position=$position
			echo SamePosition : $position
		;;
		2) 
			ladder $position
			echo "Ladder +$random1 : $position"
		;;
		*) 
			snake $position
			echo Snake -$random1 : $position
		;;
		
esac
done
}

# TO PRINT PLAYERS
players
