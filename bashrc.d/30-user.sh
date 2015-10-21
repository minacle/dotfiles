function user_colour {
	# root     Red
	local RootColour=${Red}

	# su root  Purple
	local SuRootColour=${Purple}

	# su       Cyan
	local SuColour=${Cyan}

	# user     Green
	local UserColour=${Green}

	local Username=$(logname)

	if [[ $USER != $Username ]] || [[ $Username != $(users | cut -d ' ' -f1) ]]
	then
		if [ $UID -eq 0 ]
		then
			printf $SuRootColour
		else
			printf $SuColour
		fi
	elif [ $UID -eq 0 ]
	then
		printf $RootColour
	else
		printf $UserColour
	fi
}

alias user-colour=user_colour

