#!/bin/bash -x

echo "*************************Snake and Ladder************************"

# FUNCTION FOR SNAKE
function snake(){
	position=$1
	position=$(($1-$random1))	
}

# FUNCTION FOR LADDER
function ladder(){
	position=$1
	position=$(($1+$random1))
}

# CASE STATEMENTS FOR CHECKING CONDITION
function players(){

# VARIABLE
position=0
currentposition=$position
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
}

# TO PRINT PLAYERS
players
