function dir_colour {
    local Require=32

	#      ~ 79%             NORMAL  Green
	local NormalColour=${Green}

	#  80% ~ 89% or <16G       HIGH  Yellow
	local High=16
	local HighPercent=80
	local HighColour=${Yellow}

	#  90% ~ 99% or <8G   VERY HIGH  Red
	local vHigh=8
	local vHighPercent=90
	local vHighColour=${Red}

	# 100% ~     or =0G        FULL  Black;Red
	local Full=0
	local FullPercent=100
	local FullColour=${Black}${bRed}

	#                       UNKNOWN  Cyan
	local UnknownColour=${Cyan}

	if [ -s "$PWD" ]
	then
		local Dir=$(df -P "$PWD" | tail -1)
        if [ $(echo "$Dir" | awk '{print int($2 * .2 / 1000000)}') -ge $Require ]
		then
			local Available=$(echo "$Dir" | awk '{print $4}')
			if [ $Available -le $Full ]
			then
                printf $FullColour
			elif [ $Available -le $vHigh ]
			then
                printf $vHighColour
			elif [ $Available -le $High ]
			then
                printf $HighColour
			else
                printf $NormalColour
			fi
		else
            local Capacity=$(echo "$Dir" | awk '{print int($5)}')
			if [ $Capacity -ge $FullPercent ]
			then
                printf $FullColour
			elif [ $Capacity -ge $vHighPercent ]
			then
                printf $vHighColour
			elif [ $Capacity -ge $HighPercent ]
			then
                printf $HighColour
			else
                printf $NormalColour
			fi
		fi
	else
        printf $UnknownColour
	fi
}

alias dir-colour=dir_colour

