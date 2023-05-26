# Author: Kyle Frisbee
# Purpose: To create a file in the desired directory from the user.  
#	Making the appropriate header
# Name of File: mkBash.sh
# Date Created: 9/26/2022
# Date of Last Revision: 9/27/2022
#----------------------------------------------------------------------------
# Variables
# name = name of file
# direct = name of the directory to put the file
# loop = loop variable for any loops used
# purp = purpose of the file created

#set variables
loop="y"

#now to ask the purpose of the file 
echo What is the purpose of the document created?
read purp
clear

#Make the path variable for the output
path=$1/$2.sh

#Now to make it
#All previous variables have been tested.  Now to make the file
echo "# Author: Kyle Frisbee" >> $path
echo "# File Name: $2.sh" >> $path
echo "# Date Created: $(date "+%B %d, %Y")" >> $path
echo "# Date Last Revised: $(date "+%B %d, %Y")" >> $path
echo "# Purpose: $purp" >> $path
echo "#----------------------------------------------------------------------------" >> $path
echo "# Variables" >> $path
echo >> $path
echo "#----------------------------------------------------------------------------" >> $path
echo >> $path
