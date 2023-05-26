# Author: Kyle Frisbee
# File Name: nameCheck.sh
# Date Created: September 27, 2022
# Date Last Revised: October 7, 2022
# Purpose: To check the given name if it is a valid name and return only the valid name
#----------------------------------------------------------------------------
# Variables
# name = name of the file given by the user
# $1 = Directory given by user passed through arguements
# $2 = Extension based on the file type given by the user
#----------------------------------------------------------------------------

#Start the loop
loop="y"

#Now the name
while [ $loop = y ]
do
	#Name of the file
	echo What will the name of the file be?  Do not include the extension.
	read name
	clear

	#If the file does exist then send the error message and loop.
	#Otherwise exit the loop
	if [ -f "$1/$name.$2" ]
	then
		echo Error, file $name.$2 already exists.  Please try again.
		echo
	else
		loop="n"
	fi
done

#now to save to a file
echo $name > $(pwd)/out.txt
