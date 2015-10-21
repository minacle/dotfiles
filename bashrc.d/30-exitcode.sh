function exitcode_colour {
	#   0 Success   Green
	local SuccessColor=${Green}

	# 127 Notfound  Red
	local NotfoundColor=${Red}

	#     Error     Yellow
	local ErrorColor=${Yellow}

	#     Default   White
	local DefaultColor=${White}

	if [ -z $EXITCODE ]
	then
		printf $DefaultColor
	elif [ $EXITCODE -eq 0 ]
	then
		printf $SuccessColor
	elif [ $EXITCODE -eq 127 ]
	then
		printf $NotfoundColor
	else
		printf $ErrorColor
	fi
}

alias exitcode-colour=exitcode_colour

