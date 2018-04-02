echo "bash script to check the status of git repository"

# examine git repository
path=$1
if [ ! -d "$path/.git" ]; then
path="`pwd`"
fi
echo $path

echo "Number of commits= $(git rev-list --count HEAD)"
git log -1 --pretty=format:"most recent commit information
author name= %aN
author email= %ae
comment=%s"