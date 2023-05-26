# Author: Kyle Frisbee
# File Name: mkHtml.sh
# Date Created: September 27, 2022
# Date Last Revised: October 7, 2022
# Purpose: File to be called by another so it can make an html file (Possibly
#	a style sheet) where specified
#----------------------------------------------------------------------------
# Variables
# style = used to tell fromt he user if there is a stylesheet
# title = used to tell the file what the title of the html sheet will be
# path = path of the directory and the filename given
# name = name of file
# direct = name of the directory to put the file
# loop = loop variable for any loops used
# purp = User input of purpose for the file
#----------------------------------------------------------------------------

#set variables
loop="y"

#Ask what the Title will be
echo What will the title of the file be?  Not the name of the file.
read title
clear

echo What is the purpose of the file?
read purp
clear

#set Path variable
path=$1/$2.html

#now to fill the file
echo "<!doctype html>" >> $path
echo "<html lang="en">" >> $path
echo "<html>" >> $path
echo "	<head>" >> $path
echo "		<!--" >> $path
echo "		Author: Kyle Frisbee" >> $path
echo "		File Name: $2.html" >> $path
echo "		Date Created: $(date "+%B %d, %Y")" >> $path
echo "		Date of Last Revision: $(date "+%B %d, %Y")" >> $path
echo "		Purpose: $purp" >> $path
echo "		-->" >> $path
echo "		<meta charset="utf-8">" >> $path
echo "		<title>$title</title>" >> $path

# Now if there is a stylesheet, it needs to be made then
if [ $3 = y ]
then
	#we add this little line to the html file
	echo "<link href="$2.css" rel="stylesheet" />" >> $path

	touch $1/$2.css
	path=$1/$2.css
	echo "@charset "utf-8";" > $path
	echo "/*" >> $path
	echo "Author: Kyle Frisbee" >> $path
	echo "File Name: $2.css" >> $path
	echo "Date Created: $(date "+%B %d, %Y")" >> $path
	echo "Date of Last Revision: $(date "+%B %d, %Y")" >> $path
	echo "Purpose: $purp" >> $path
	echo "*/" >> $path
fi

#Set the path back to the HTML file and finish er up
path=$1/$2.html
echo "	</head>" >> $path
echo "	<body>" >> $path
echo "	</body>" >> $path
echo "</html>" >> $path
