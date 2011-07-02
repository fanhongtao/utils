# This file is included by others. 

# check input args to see if need to show help message.
function CheckForHelp()
{
    for one in $@; do
        if [ "$one" = "-h" -o "$one" = "-help" ]; then
            ShowHelp
        fi
    done 
}


