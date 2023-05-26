# Author: Kyle Frisbee
# File Name: directCheck.sh
# Date Created: September 27, 2022
# Date Last Revised: October 7, 2022
# Purpose: To check the given directory if it is valid or not.
#----------------------------------------------------------------------------
# Variables
# loop = Variable to hold whether or not to loop
# direct = Holds the directory given by the user
#----------------------------------------------------------------------------

#set the loop
loop="y"

#Name of the directory
while [ $loop = y ]
do
	echo "Which Directory will the program be made in?"
	echo Here is the current directory for reference:
	pwd
	read direct
	clear

	#If the directory does exist, exit the loop.  Otherwise send an error message and keep looping
	if [ -d $direct ]
	then
		loop="n"
	else
		echo Error, Directory: $direct does not exist. Please try again.
		echo
	fi
done

#Now we send to the output file
echo $direct > $(pwd)/out.txt
