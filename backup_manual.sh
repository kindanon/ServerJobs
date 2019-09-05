#!/bin/bash

#nas backup, sync hdds
nas_bak(){rsync -axPH --delete /source/ /destination/}

#server backup, sync hdds
svr_bak(){rsync -axP --delete /source/ /destination/}

#capture backup, capture -> server
#00 04 * * * rsync -axP /source/ /destination/
cap_bak(){rsync -axP --remove-source-files /ip/source/ /destination/ } #problems with dynamic files

#server forward, server -> editing
svr_for(){rsync -ax /source/ /ip/destination/}

#I will just trigger this one
#editing backup, editing -> server
edt_bak(){rsync -axP /ip/source/ /destination/}

#TODO trigger upload command
#TODO should probably delete server data after editing is FINALIZED

#TODO better server stuff
# https://askubuntu.com/questions/105848/rsync-between-two-computers-on-lan

#TODO weird function stuff
# https://stackoverflow.com/questions/8818119/how-can-i-run-a-function-from-a-script-in-command-line
"$@" #allows you to call functions from terminal / CRON 
#call functions like ./.../folder/CRON backup.sh func_name()