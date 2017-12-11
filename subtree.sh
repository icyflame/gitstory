CURRENT=`pwd`
FILENAME="$CURRENT/final_out_`date +%s`"

touch $FILENAME

DEBUG="YES"
DEBUG=""

function debug {
  if [[ $DEBUG == "YES" ]]; then
    echo $@;
  fi
}

# if [ $# -ge 1 ]; then
  # echo "Passed first argument"
  # echo $1;
  # cd $1;
# fi;

if [ -n "$1" ]; then
  cd $1;
fi;

BEGINNING="yesterday"
if [ -n "$2" ]; then
  BEGINNING="$2"
fi

echo "Found `ls | wc -l` files under `pwd`"
echo "Searching for commits from $BEGINNING"
echo "Output goes to $FILENAME.final"
echo
echo

for dir in `ls`; do
  debug "Searching for $dir in `pwd`";

  # check if this is a directory
  if [ -d "$dir" ]; then

    # if yes, check if the current user has the privileges to enter this
    # directory
    RESULT="$(cd $dir)"
    if [ -z "$RESULT" ]; then

      cd $dir
      # check if this is a directory that is a git repository
      debug "  Entered `pwd`";
      if [ -e .git ]; then

        debug "    Running in `pwd`"
        git --no-pager log --since="$BEGINNING" \
          --date=short \
          --pretty=format:"$(git config --get remote.origin.url | awk -F '/' '{ print $2 }' | awk -F '.' '{ print $1 }'): %ad - [%s]" --author="$(git config --get user.name)" >> $FILENAME 
        printf "\n\n" >> $FILENAME
      else
        debug "      $dir isn't a git repo"
      fi;
      cd ..;
    else
      debug "  cd into $dir didn't work out!"
      debug "ERROR: $RESULT";
    fi;
  else
    debug "  $dir is not a directory";
  fi;
done;

uniq $FILENAME > $FILENAME.final
rm $FILENAME
cat $FILENAME.final

cd $CURRENT;
