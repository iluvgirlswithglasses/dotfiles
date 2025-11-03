
######################################################################
#### --------------------- system variables --------------------- ####
######################################################################

set -x PATH $PATH /usr/sbin ~/.local/bin

abbr --add cloneme git clone ssh+git://git@github.com/iluvgirlswithglasses/
abbr --add setntp timedatectl set-ntp
abbr --add settime sudo timedatectl set-time


#######################################################################
#### -------------------------- aliases -------------------------- ####
#######################################################################

alias py="python3"
alias vim="nvim"
alias cin="cat"
alias q="exit"
alias :q="exit"
alias clip="xsel --clipboard"


#######################################################################
#### ----------------------- quick actions ----------------------- ####
#######################################################################

function yd
    pwd | tr -d '\n' | xsel --clipboard;
end

function rundisown
    echo $argv[1..]
    $argv[1..] 2> /dev/null &
    set PID (jobs --last --pid)
    disown $PID
end


#######################################################################
#### ---------------------- terminal config ---------------------- ####
#######################################################################

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function postexec_test --on-event fish_postexec
   echo
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    macchina-linux-x86_64
end

fish_config prompt choose informative

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

