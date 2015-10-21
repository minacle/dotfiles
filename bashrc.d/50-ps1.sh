function ps1time {
	PS1="${PS1}$2\[$1\]\t\[$Origin\]$3"
}

function ps1user {
	PS1="${PS1}$2\[$1\]\u\[$Origin\]$3"
}

function ps1at {
	PS1="${PS1}$2\[$1\]@\[$Origin\]$3"
}

function ps1host {
	PS1="${PS1}$2\[$1\]\h\[$Origin\]$3"
}

function ps1perm {
	PS1="${PS1}$2\[$1\]:\[$Origin\]$3"
}

function ps1dir {
	PS1="${PS1}$2\[$1\]\W\[$Origin\]$3"
}

function ps1sign {
	PS1="${PS1}$2\[$1\]\$\[$Origin\]$3"
}

PS1="\[$Origin\]"

