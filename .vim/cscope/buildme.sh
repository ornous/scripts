#!/bin/sh
buildCS()
{
	
	fileList=/tmp/cscope.files
	dbFile=~/.vim/cscope/currentdb.out
	echo "Scanning directory for PHP files..."
	ls -rd -1 $PWD/**/* | grep -E '*.php$'	> $fileList

	echo "Building cscope database..."
	/usr/bin/time -f "Built in: %e" \
	cscope -b -i $fileList -f $dbFile

	echo "Cleaning out temporary files."
	rm $fileList
	CSCOPE_DB=$dbFile; export CSCOPE_DB

	echo 'Done'
	return $TRUE
}

buildCS
exit 0
