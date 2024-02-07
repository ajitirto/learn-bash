#pint for cuntion 

usage() {
    echo "this prog does:..."
    echo "flags:"
    echo "-h print help"
}

usage() {
    cat <<- EOF
    usage: $PROGNAME options
    
    Program deletes files from filesystems to release space. 
    It gets config file that define fileystem paths to work on, and whitelist rules to 
    keep certain files.

    OPTIONS:
       -c --config              configuration file containing the rules. use --help-config to see the syntax.
       -n --pretend             do not really delete, just how what you are going to do.
       -t --test                run unit test to check the program
       -v --verbose             Verbose. You can specify more then one -v to have more verbose
       -x --debug               debug
       -h --help                show this help
          --help-config         configuration help

    
    Examples:
       Run all tests:
       $PROGNAME --test all

       Run specific test:
       $PROGNAME --test test_string.sh

       Run:
       $PROGNAME --config /path/to/config/$PROGNAME.conf

       Just show what you are going to do:
       $PROGNAME -vn -c /path/to/config/$PROGNAME.conf
    EOF 
}


# trim space kosong
trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "${1~~}"
}

if [[ $var == *sub_string* ]]; then
    printf '%s\n' "sub_string is in var."
fi

# Loop from 0-100 (no variable support).
for i in {0..100}; do
    printf '%s\n' "$i"
done


# PNG files in dir.
for file in ~/Pictures/*.png; do
    printf '%s\n' "$file"
done

# Iterate over directories.
for dir in ~/Downloads/*/; do
    printf '%s\n' "$dir"
done

# Brace Expansion.
for file in /path/to/parentdir/{file1,file2,subdir/file3}; do
    printf '%s\n' "$file"
done


count() {
    # Usage: count /path/to/dir/*
    #        count /path/to/dir/*/
    printf '%s\n' "$#"
}

# Syntax: {<START>..<END>}

# Print numbers 1-100.
echo {1..100}

# Print range of floats.
echo 1.{1..9}

# Print chars a-z.
echo {a..z}
echo {A..Z}

# Nesting.
echo {A..Z}{0..9}

# Print zero-padded numbers.
# CAVEAT: bash 4+
echo {01..100}

# Change increment amount.
# Syntax: {<START>..<END>..<INCREMENT>}
# CAVEAT: bash 4+
echo {1..10..2} # Increment by 2.

echo {apples,oranges,pears,grapes}

# Example Usage:
# Remove dirs Movies, Music and ISOS from ~/Downloads/.
rm -rf ~/Downloads/{Movies,Music,ISOS}