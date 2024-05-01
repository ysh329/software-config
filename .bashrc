############## COLOR ###############
# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it 
function gitPrompt {
  #command -v __git_ps1 > /dev/null && __git_ps1 " (%s)" 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular 
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green 
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White 
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green 
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White 
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green 
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White 
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red   
badgrn='\[\e[42m\]'   # Green 
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue  
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan  
bakwht='\[\e[47m\]'   # White 
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtpur}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Red name for root
if [ "${UID}" -eq "0" ]; then
  nameC="${txtred}"
fi

# Patent Pending Prompt
export PS1="${nameC}\u${atC}@${hostC}\h:${pathC}\w${gitC}\$(gitPrompt)${pointerC}▶${normalC} "

############## ALIAS ###############
alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gp='git push origin HEAD:refs/for/main'

git_branch_keep() {
    local keep_branch

    if [[ "$1" == "--keep" ]]; then
        keep_branch="$2"

        if [[ -z "$keep_branch" ]]; then
            echo "Error: Please specify the branch you want to keep."
            return 1
        elif [[ ! $(git rev-parse --verify "$keep_branch") ]]; then
            echo "Error: '$keep_branch' is not a valid branch."
            return 1
        fi

        echo "You need to manually execute the following commands:"
        local branches_to_delete
        branches_to_delete=$(git branch | grep -v "^\*" | grep -v "$keep_branch" | xargs -n 1 echo "git branch --delete ")
        echo -e "$branches_to_delete"
    else    
        echo "Usage: ${FUNCNAME[0]} --keep <branch-name>"
        echo "       Generates commands to delete merged branches except <branch-name>, which you need to execute manually."
        return 1
    fi
}
alias gbk='git_branch_keep'

############## OTHERS ###############
trap date DEBUG
alias ls='ls --color=auto'
