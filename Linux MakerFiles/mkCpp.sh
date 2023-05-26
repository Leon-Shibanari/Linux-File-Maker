# Author: Kyle Frisbee
# File Name: mkCpp.sh
# Date Created: November 28, 2022
# Date Last Revised: November 28, 2022
# Purpose: Used to make the file in the directory specified with the appropriate header and anything else the user may or may not need
#----------------------------------------------------------------------------
# Variables
# name = name of file
# direct = name of the directory to put the file
# loop = loop variable for any loops used
# purp = purpose of the file created
# input = used to take in user input
# full = used to help complete a full line for the libraries
#----------------------------------------------------------------------------
# Functions
libRef() {
	while [ $loop = y ]
	do
		echo "What is the name of the library/reference?  Don't worry about the #include$1$2"
        	read input
        	clear

        	full="#include $1$input$2        //"
	
	        echo "Please describe what the library/Reference does.  Dont worry about the //"
	        read input
	        clear
	
        	full=$full	$input

        	#now we send that library to the file
        	echo $full >> $3

        	#lastly, we ask if they have any more libraries they want to add
        	echo Any more Libraries/References? "[y/n]"
        	read loop
        	clear
	done
}
#----------------------------------------------------------------------------
#reset loop variable for later
loop="y"

#The loop variable will now be defaulted to n from this point on
#now to ask the purpose of the file
echo What is the purpose of the document created?
read purp
clear

#set the path variable to the file.
path=$1/$2.cpp

#Now we start to make the file
echo "/*" >> $path
echo "Author: Kyle Frisbee" >> $path
echo "File Name: $2.cpp" >> $path
echo "Date Created: $(date "+%B %d, %Y")" >> $path
echo "Date Last Revised: $(date "+%B %d, %Y")" >> $path
echo "Purpose: $purp" >> $path
echo "*/" >> $path
echo "" >> $path
echo "//Libraries" >> $path
echo "#include <iostream>	//Standard Library" >> $path

#now we check if there are any more libraries we need to add
echo Aside from the library iostream, are there any other libraries? "[y/n]"
read loop
clear

if [ $loop = "y" ]
then
        type1="<"
	type2=">"
        libRef $type1 $type2 $path
fi


#now we check if there are any more libraries we need to add
echo Is there any files you wish to reference? "[y/n]"
read loop
clear

if [ $loop = "y" ]
then
	type1=" \""
	type2="\""
	libRef $type1 $type2 $path
fi

#Finally ask the question
echo Would you like 'using namespace std' outside the main? "[y/n]"
read loop
clear
if [ $loop = "y" ]
then
	echo "" >> $path
	echo "using namespace std;" >> $path
fi

#Finish up the main for the file
echo "" >> $path
echo "int main()" >> $path
echo "{" >> $path
echo "}" >> $path

#Ask to see if there are more files or not
echo Would you like a compiler for the file? "[y/n]"
read loop
clear

while [ $loop = y ]
do
	#ask what they want to name it
	echo What shall we call the compiler?  Do not include the .sh
	read input
	clear

	#check to see if it exists already
	if [ -f "~/www/$1/$input.sh" ]
	then
		echo Error.  File already exists.  Try a different name.
		echo
		loop="y"
	else
		path=$1/$input.sh 
		echo "# Author: Kyle Frisbee" >> $path
		echo "# Date Created: $(date "+%B %d, %Y")" >> $path
		echo "# File compiled and run: $2" >> $path
		echo "# This file is simply made to compile and run the associated file.  Once compiled it will run the output." >> $path
		echo "g++ $2.cpp && ./a.out" >> $path
		loop="n"
	fi
done
