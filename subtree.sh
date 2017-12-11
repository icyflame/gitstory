CURRENT=`pwd`
FILENAME="$CURRENT/final_out_`date +%s`"
touch $FILENAME
echo "Output goes to $FILENAME"
echo
echo

if [ $# -ge 1 ]; then
  echo "Passed first argument"
  echo $1;
  cd $1;
fi;

echo "Found `ls | wc -l` files under `pwd`"

for dir in `ls`; do
  echo "Searching for $dir in `pwd`";

  # check if this is a directory
  if [ -d "$dir" ]; then

    # if yes, check if the current user has the privileges to enter this
    # directory
    RESULT="$(cd $dir)"
    if [ -z "$RESULT" ]; then

      cd $dir
      # check if this is a directory that is a git repository
      echo "  Entered `pwd`";
      if [ -e .git ]; then

        echo "    Running in `pwd`"
        git --no-pager log --since="yesterday" \
          --date=short \
          --pretty=format:"$(git config --get remote.origin.url | awk -F '/' '{ print $2 }' | awk -F '.' '{ print $1 }'): %ad - [%s]" --author="$(git config --get user.name)" >> $FILENAME 
        echo "" >> $FILENAME
      else
        echo "      $dir isn't a git repo"
      fi;
      cd ..;
    else
      echo "  cd into $dir didn't work out!"
      echo "ERROR: $RESULT";
    fi;
  else
    echo "  $dir is not a directory";
  fi;
done;

uniq $FILENAME > $FILENAME.final
rm $FILENAME
cat $FILENAME.final

cd $CURRENT;
