function job_colour {
	# stopped  Red
	local StoppedColour=${Red}

	# running  Purple
	local RunningColour=${Purple}

	# default  Green
	local DefaultColour=${Green}

	if [ $(jobs -s | wc -l) -gt 0 ]
	then
		printf $StoppedColour
	elif [ $(jobs -r | wc -l) -gt 0 ]
	then
		printf $RunningColour
	else
		printf $DefaultColour
	fi
}

alias job-colour=job_colour

