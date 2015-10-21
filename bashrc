[[ $- != *i* ]] && return

if [[ -d ~/.bashrc.d ]]
then
    for file in ~/.bashrc.d/*.sh
    do
        . $file
    done
fi

ps1time '$(load-colour)'
ps1user '$(user-colour)' ' '
ps1at '$(job-colour)$Bold'
ps1host '$(temperature-colour)'
ps1perm '$(permission-colour)$Bold'
ps1dir '$(dir-colour)'
ps1sign '$(exitcode-colour)$Bold' ' ' ' '

