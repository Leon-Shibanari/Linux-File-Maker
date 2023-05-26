# Author: Kyle Frisbee
# File Name: mkFile.sh
# Date Created: September 2, 2022
# Date of Last Revision: November 28, 2022
# Purpose: To make any file specified
#----------------------------------------------------------------------------
# Variables
# lang = program language for the file
# loop = exit check.  Loop unless this changes
# sameDirect = used to tell the program if we are in the same directory or not
# direct = directory path given by the user
#----------------------------------------------------------------------------
# Function
# Used for looping the file until; correct.
# 1 is associated file
# 2 is the language
mkWhile() {
	#Default Variables
	loop="y"
	sameDirect="n"
	
	#get the output file ready
	outPath=$(pwd)
	touch $outPath/out.txt

	#is loopin time
	while [ $loop = y ]
        do
                #If the directory is the same then output the current directory
                #Otherwise, run through the direct check to change directory
                if [ $sameDirect = y ]
                then
                        echo Directory is currently: $direct
                        echo
                else
                        #Get the directory
                        sh ~/www/CS330/maker/directCheck.sh
                        direct=$(tail $outPath/out.txt)
                fi

                #Get the name of the file
                sh ~/www/CS330/maker/nameCheck.sh $direct $2
                name=$(tail $outPath/out.txt)

                #run the associated file
                sh ~/www/CS330/maker/$1.sh $direct $name

                #Now ask if they want to make any more files
                echo Would you like to make another $2 file? "[y/n]"
                read loop
                clear

                #Will it be the same directory?
                if [ $loop = y ]
                then
                        echo Will this be the same directory? "[y/n]"
                        read sameDirect
                        clear
                fi
        done

	#now remove the file
	rm $outPath/out.txt
}
#----------------------------------------------------------------------------
#Set the variable
loop="y"

#Clear the Screen
clear

#Find out what file language they want
while [ $loop = y ]
do
	#Get the language of the file needed
	echo What language will thie be in?
	echo "[ sh / c / c++(In Progress) / html / python(In Progress) ]"
	read lang
	clear

	#check to make sure it matches the options
	if [ $lang = sh ] || [ $lang = c ] || [ $lang = c++ ] || [ $lang = html ] || [ $lang = python ]
	then
		loop="n"
	else
		echo Error, $lang is not a valid option.  Please try again.
		echo
	fi
done

#Now we know the language
#Now make a file based upon the language
if [ $lang = sh ]
then
	mkWhile mkSh $lang
elif [ $lang = html ]
then
	mkWhile mkHtml $lang
elif [ $lang = c ]
then
	mkWhile mkC $lang
elif [ $lang = "c++" ]
then
	mkWhile mkCpp $lang
fi

#prompt the user and let them know we are done
echo Press enter when ready to move on
read waiter
clear
