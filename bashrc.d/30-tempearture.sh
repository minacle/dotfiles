function temperature_colour {
	#    ~  9   VERY LOW  Blue
	local vLowColour=${Blue}

	# 10 ~ 29        LOW  Cyan
	local Low=10
	local LowColour=${Cyan}

	# 30 ~ 49     NORMAL  Green
	local Normal=30
	local NormalColour=${Green}

	# 50 ~ 69       HIGH  Yellow
	local High=50
	local HighColour=${Yellow}

	# 70 ~     VERY HIGH  Red
	local vHigh=70
	local vHighColour=${Red}

    #            UNKNOWN  White
    local UnknownColour=${White}
	
    case "$OSTYPE" in
        linux*)
            local Temperature=$(cat /sys/class/thermal/thermal_zone0/temp | perl -pe "s/(-?[0-9]*)[0-9]{3}/\1/")
            ;;
        darwin*)
            hash osx-cpu-temp && local Temperature=$(osx-cpu-temp | cut -d . -f1)
            ;;
    esac

    if [ -z $Temperature ]
    then
        printf $UnknownColour
	elif [ $Temperature -lt $Low ]
	then
        printf $vLowColour
	elif [ $Temperature -lt $Normal ]
	then
        printf $LowColour
	elif [ $Temperature -lt $High ]
	then
        printf $NormalColour
	elif [ $Temperature -lt $vHigh ]
	then
        printf $HighColour
	else
        printf $vHighColour
	fi
}

alias temperature-colour=temperature_colour

