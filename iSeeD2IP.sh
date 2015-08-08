#iSeeD2IP Version 0.1b
#!/bin/bash

CD="./CocoaDialog.app/Contents/MacOS/CocoaDialog"

SELECT=1
while [ "$SELECT" -eq "1" ]
do
	IP=`netstat -n | grep .4000 | sed 's/.4000.*$//g' | rev | cut -b-4 | rev | sed "s/^.*\.//g"`	
	GAME_EXIST=`echo $IP | wc -c`
	echo $GAME_EXIST
	if [ "$GAME_EXIST" -eq "1" ]; then
		MSG=`echo "Game_does_not_exist!"`
	else
		MSG=`echo "Game_IP_is_"$IP`
	fi
	echo $MSG
	rv=`$1/Contents/Resources/$CD msgbox --title "iSeeD2IP V0.1beta"  \\
    	--text "Diablo II Game IP Detector" --informative-text $MSG  \\
    	--icon find --button1 "Refresh" --button2 "Quit"`
	SELECT=`echo $rv | sed 's/^.*1\ //g'`
	if [ "$SELECT" -eq "1" ]; then
		continue
	else
		break
	fi
done
    

