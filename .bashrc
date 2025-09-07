
######################################################################
#### --------------------- system variables --------------------- ####
######################################################################

export PATH=$PATH:/usr/sbin:~/.local/bin

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


######################################################################
#### ---------------------- greeting scene ---------------------- ####
######################################################################

macchina-linux-x86_64;
printf "that's that, and this is this\n";


#######################################################################
#### -------------------------- aliases -------------------------- ####
#######################################################################

alias py="python3";
alias vim="nvim";
alias cin="cat";
alias q="exit";
alias :q="exit";
alias clip="xsel --clipboard";


#######################################################################
#### ------------------ quick directory actions ------------------ ####
#######################################################################

function qpush() {
	git add .;
	git commit -m "$1";
	git push;
}

function pullsh() {
	git pull;
	qpush $1;
}

function lsi() {
	# print file with index $1
	ls | sed -n $1p;
}

function cdi() {
	# cd to folder with index $1
	cd "`ls | sed -n $1p`";
}

function yd() {
	# yank current directory path
	pwd | xsel --clipboard;
}

function yf() {
	# yank the path of the file with index $1
	echo "`readlink -f ./`/`ls | sed -n $1p`" | xsel --clipboard
}


#######################################################################
#### ------------------------ mpv aliases ------------------------ ####
#######################################################################

function mpvp() {
	# mpv plays a file
	mpv "`ls | sed -n $1p`";
}

function mpvd() {
	# mpv plays everything in directory
	ls | egrep '\.flac$|\.wav$|\.ogg$|\.mka$|\.webm$|\.m4a$|\.mp3$|\.mkv$|>' > ".mpv-pl-list";
	mpv -playlist=".mpv-pl-list";
	rm ".mpv-pl-list";
}

function mpva() {
	# mpv plays audio with no display
	mpv "`ls | sed -n $1p`" --no-audio-display;
}

function mpvl() {
	# mpv plays everything in directory with no display
	ls | egrep '\.flac$|\.wav$|\.ogg$|\.mka$|\.webm$|\.m4a$|\.mp3$|\.mkv$|\.mp4$' > ".mpv-pl-list";
	mpv -playlist=".mpv-pl-list" --no-audio-display;
	rm ".mpv-pl-list";
}

function mpvr() {
	# recursively plays everything in directory with no display
	find . -print | egrep '\.flac$|\.wav$|\.ogg$|\.mka$|\.webm$|\.m4a$|\.mp3$|\.mkv$|\.mp4$' > ".mpv-pl-list";
	mpv -playlist=".mpv-pl-list" --no-audio-display;
	rm ".mpv-pl-list";
}


#######################################################################
#### ---------------------- terminal config ---------------------- ####
#######################################################################

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

if [ "${TERM:0:5}" == "xterm" ]
then
	typeset TERM=xterm-color  # force colour prompt
fi

function statstring {
RC=$?
	if [ "0" != $RC ]; then
		printf "[$RC] "
	fi
}

case "$TERM" in xterm-color)
	# PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
	if [ "$USER" = root ]; then
		PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${arch_chroot:+($arch_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\] \$ '
	else
		PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\] \$ '
	fi
	;;
*)
	PS1='${arch_chroot:+($arch_chroot)}\u@\h:\W\$ '
	;;
esac

if [ "$TERM" == "xterm-color" ]; then
	typeset TERM=xterm  # force basic prompt
fi


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

