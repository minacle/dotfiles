function permission_colour {
	# w
	local wColour=${Green}

	# r
	local rColour=${Yellow}

	# x
	local xColour=${Red}

	if [ -w "${PWD}" ]
	then
		printf $wColour
	elif [ -r "${PWD}" ]
	then
		printf $rColour
	else
		printf $xColour
	fi
}

alias permission-colour=permission_colour

