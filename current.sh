CURRENT=`pwd`
if [ -e $1 ]; then
  cd $1;
fi

echo "Running in `pwd`"
git --no-pager log --since="yesterday" \
        --date=short \
        --pretty=format:"$(git config --get remote.origin.url | awk -F '/' '{ print $2 }' | awk -F '.' '{ print $1 }'): %ad - [%s]" --author="$(git config --get user.name)"

cd $CURRENT
