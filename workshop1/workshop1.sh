echo "bash script to check the status of git repository"

 # examine git repository
 path=$1
 if [ ! -d "$path/.git" ]; then
 	path="`pwd`"
 fi
 echo $path

 git log -1 --pretty=format:"most recent commit information
 author name= %aN
 author email= %ae
 comment=%s"