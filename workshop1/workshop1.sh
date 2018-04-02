echo "bash script to check the status of git repository"

 # examine git repository
 path=$1
 if [ ! -d "$path/.git" ]; then
 	path="`pwd`"
 fi
 echo $path