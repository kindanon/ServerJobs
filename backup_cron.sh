#!/bin/bash

#nas backup, sync hdds
00 04 */2 * * rsync -axPH --delete /source/ /destination/

#server backup, sync hdds
00 04 * * 1 rsync -axP --delete /source/ /destination/

#capture backup, capture -> server
#00 04 * * * rsync -axP /source/ /destination/
00 05 * * * rsync -axP --remove-source-files /ip/source/ /destination/ #problems with dynamic files

#server forward, server -> editing
00 06 * * * rsync -ax /source/ /ip/destination/

#I will just trigger this one
#editing backup, editing -> server
00 07 * * * rsync -axP /ip/source/ /destination/

#TODO trigger upload command
#TODO should probably delete server data after editing is FINALIZED

#TODO better server stuff
# https://askubuntu.com/questions/105848/rsync-between-two-computers-on-lan