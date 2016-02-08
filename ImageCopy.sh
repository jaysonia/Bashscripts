#! /bin/bash
# Name: Jason O'Connell
# Student Number: 13710859
# email: 13710859@ucdconnect.ie
# copys directory stucture and copies png files and changes them to jpg
# Step 1 check if 2 arguments are passed in
# Step 2: Check if the source directory exists
# Step 3: if cannot write to destination print error
# Step 4: copy directory Structure
# Step 5: copy all png files and change extension

ext1=.png
ext2=.jpg
cwd=$(pwd)

if [ ! $# -eq 2 ];
then echo Usage: ./assign3.sh source_path destination_path; exit
elif [[ ! -e $1 ]];
then echo Error: directory $1 not found;exit
elif [[ ! -e $2 ]];
then mkdir $2;
fi

if [[ ! -w $2 ]];
then echo Error: directory $2 not writable;exit
fi

cd $1
find . -type d -exec mkdir -p $cwd/$2/{} \;
find . -name '*.png' | while read line; do
	file2=${line/$ext1/$ext2}
	convert "$line" $cwd/$2/"$file2"
done

exit
