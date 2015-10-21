function load_colour {
	#      ~ 24%  Green
	local NormalColour=${Green}

	#  25% ~ 49%  Yellow
	local Medium=25
	local MediumColour=${Yellow}

	#  50% ~ 99%  Purple
	local High=50
	local HighColour=${Purple}

	# 100% ~      Red
	local Extreme=100
	local ExtremeColour=${Red}

	# UNKNOWN     White
	local UnknownColour=${White}

    case "$OSTYPE" in
        linux*)
            local Load=$(cut -d ' ' -f1 /proc/loadavg)
            local ProcessCount=$(nproc)
            ;;
        darwin*)
            local Load=$(sysctl -n vm.loadavg | cut -d ' ' -f2)
            local ProcessCount=$(sysctl -n hw.ncpu)
            ;;
    esac

	if [ -z $Load ] || [ -z $ProcessCount ]
	then
        printf $UnknownColour
	else
        Load=${Load//.}
		if [ $(($Load / $ProcessCount)) -lt $Medium ]
		then
            printf $NormalColour
        elif [ $(($Load / $ProcessCount)) -lt $High ]
		then
            printf $MediumColour
        elif [ $(($Load / $ProcessCount)) -lt $Extreme ]
		then
            printf $HighColour
		else
            printf $ExtremeColour
		fi
	fi
}

alias load-colour=load_colour

