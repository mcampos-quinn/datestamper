#!/bin/sh

files="${1}"/*
echo $files

if [[ ! -d "${1}/out/" ]] ; then
	mkdir "${1}/out/"
fi



for file in $files ; do 
	dateTimeOrig=$(exiftool $file | grep -m 1 "Date/Time Original")
	createDate=$(exiftool $file | grep -m 1 "Create Date")
	whatever=$(exiftool $file | grep -m 1 "Date")
	if [ ! -d $file ] ; then
		filename="${file##*/}"
		filenameWithoutExtension="${filename%.*}"
		echo "$filename"
		if [[ ! -z $dateTimeOrig ]] ; then
			FILEDATE=$dateTimeOrig
		elif [[ -z $dateTimeOrig ]] && [[ ! -z $createDate ]] ; then
			FILEDATE=$createDate
		else
			FILEDATE=$whatever
		fi
		PIXELHEIGHT=$(exiftool -s -s -s -ImageHeight $file)
		echo $PIXELHEIGHT
		TEXTSIZE=$(bc <<< "$PIXELHEIGHT * .025")
		echo $TEXTSIZE
		montage -label "$FILEDATE" $file -geometry +0+0 -pointsize "$TEXTSIZE" "${1}/out/$filename"
	fi
done
