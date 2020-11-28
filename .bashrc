# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# locale are messed
export LC_ALL="en_US.UTF-8"

export EDITOR=vim

#missing /lib/x86_64-linux-gnu/libssl.so.1.0.0
#libcurl*
export LD_LIBRARY_PATH=/home/mbykowsx/lib-curl/lib
#libcrypto NOTE: for scp from outside to this server, eg. atfsync
export LD_LIBRARY_PATH=/home/mbykowsx/bin/libcrypto:$LD_LIBRARY_PATH
#libevent
export LD_LIBRARY_PATH=/home/mbykowsx/bin/libevent/lib:$LD_LIBRARY_PATH
#libgdm
export LD_LIBRARY_PATH=/home/mbykowsx/bin/libgdbm/lib:$LD_LIBRARY_PATH
#curl
export PATH=/home/mbykowsx/lib-curl/bin:$PATH
#git
export PATH=/home/mbykowsx/bin/git/bin:$PATH
export GIT_SSL_NO_VERIFY=true
#tmux
export PATH=/home/mbykowsx/bin/tmux/bin:$PATH
#perl5
#export PATH=/home/mbykowsx/localperl/bin:$PATH
#squlite
export PATH=/home/mbykowsx/bin/sqlite-tools-linux-x86-3220000:$PATH
#cscope
export PATH=/home/mbykowsx/bin/cscope/bin:$PATH
#ssh and scp
#export PATH=/home/mbykowsx/bin:$PATH
alias sshold=/usr/bin/ssh

alias git-svn=/home/mbykowsx/bin/git-svn

export GIT_SSL_NO_VERIFY=true

#debug git curl
#export GIT_CURL_VERBOSE=1

#perl @INC
#export PERL5LIB=/home/mbykowsx/localperl/lib/site_perl/5.26.1/x86_64-linux

#libxml2
export PATH=/home/mbykowsx/bin/libxml2/bin:$PATH

#export PATH=/home/mbykowsx/bin/bin-from-marekm/git/bin:$PATH
#export PATH=/usr/bin/:$PATH
alias yo="cd /yocto/mbykowsx/yocto"
alias wr="cd /yocto/mbykowsx/wr"
#python
export PATH=/home/mbykowsx/bin/Python-275:$PATH

# If not running interactively, don't do anything
case $- in
    *i*) echo "interactive shell"
            ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cc='cd /workspace/sw/mbykowsx/lionfish'
alias ec='cd /workspace/sw/mbykowsx/eagle'
alias sr='cd /workspace/sw/mbykowsx/lionfish/srift-srift'
alias dl='cd /workspace/sw/mbykowsx/lionfish/axxia_support_private/linux/datalogger'
alias as='cd /workspace/sw/mbykowsx/lionfish/ase_rte; pwd'
alias ds='cd /workspace/sw/mbykowsx/lionfish/ase_rte/workspace/DspLoadBalance/DspLoadBalance; pwd'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#export PATH="/home/mbykowsx/vim74/src:/usr/local/share/vim/syntax:$PATH"
#export PATH="/workspace/sw/mbykowsx/lionfish/ase/jre1.8.0_51/bin:$PATH"

cs_func() {
        echo $PWD
        find "$PWD" \( -name '*.[cshS]' -o -name '*.txt' -o -name '*.lds' \
			-o -name '*.pl' -o -name '*.rts' \) > "$PWD"/cscope.files
        cd $PWD && /home/mbykowsx/bin/cscope/bin/cscope -b -R
	CSCOPE_DB=${PWD}/cscope.out; export CSCOPE_DB
}
#if exclude path from cscope'ing
#find "$PWD" \( -name '*.[cshS]' -o -name '*.txt' -o -name '*.lds' \) \
#			-not -path "./board/axxia/axm5600/*" > "$PWD"/cscope.files
alias cs=cs_func

gr_func() {
	what=$1
	where="$2"
	for f in `find ./ -name "$where"`; do
		if grep -q $what $f; then
			echo $f
			grep -ni $what $f
		fi
	done
}
alias gr=gr_func


tunnel_mutt() {
if [[ 1 -eq 2 ]]; then
	/home/mbykowsx/bin/ptunnel/src/ptunnel.py -d -p \
	proxy-chain.intel.com:912 9993:imap.gmail.com:993 \
	5587:smtp.gmail.com:465 &
else
	/home/mbykowsx/bin/proxytunnel-1.9.0/proxytunnel -p \
		proxy-chain.intel.com:912 -d imap.gmail.com:993 -a 9993 &
	/home/mbykowsx/bin/proxytunnel-1.9.0/proxytunnel -p \
		proxy-chain.intel.com:911 -d smtp.gmail.com:587 -a 5587 &

fi
}



#export_ncp_rte() {
#	D=`pwd`
#    cd $1
#	echo "sourcing $1"
#	source ./ncp.env
#	cd $D
#}
#rte1=/workspace/sw/mbykowsx/lionfish/ncp_rte_arm
#rte_ep=/workspace/sw/mbykowsx/lionfish/trunk/images/ncp_linux-ep8572_xlf_rte_bin/ncp_rte
#rte_waco=/workspace/sw/mbykowsx/lionfish/trunk/images/ncp_linux-arma53_rte_bin/ncp_rte
#ncp_rte_a53_int=/workspace/sw/mbykowsx/lionfish/ncp_rte_a53_int
#ncp_rte_a53_ext=/workspace/sw/mbykowsx/lionfish/ncp_rte_a53_ext
#export_ncp_rte $ncp_rte_a53_int

#for ARM ISS
#license
#export ARMLMD_LICENSE_FILE=8225@fmylic7001.fm.intel.com
#armcc
#export PATH="/tools/AGRreleases/ds5/arm-ds-5.22-x86_64/sw/ARMCompiler5.05u2/bin:$PATH"
#export ASE_INSTALL=/workspace/sw/mbykowsx/lionfish/ase

#TARGET=armv8_old_server
TARGET=armv8_new_server
#TARGET=armv7
if [[ $TARGET == armv8_old_server ]]; then
	#build for X9 and XLF
	#export PATH=/tools/AGRreleases/yocto/jethro_11Jul2016/axxia-arm64-x9/tools/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux:$PATH
	#export PATH=/tools/AGRreleases/yocto/jethro_20Feb2017/axxia-arm64-x9/tools/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux:$PATH
	#export PATH=/tools/AGRreleases/yocto/tools_jethro/armv8/axxia-image-large/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux:$PATH
	#export PATH=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/aarch64-axxia-linux:$PATH
	export PATH=/tools/AGRreleases/yocto/morty/axxia_gen2_04apr2018/axxia-arm64-x9/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/aarch64-axxia-linux:$PATH
	export CROSS_COMPILE=aarch64-axxia-linux-
	#export SYSROOT=/tools/AGRreleases/yocto/jethro_11Jul2016/axxia-arm64-x9/tools/sysroots/aarch64-poky-linux
	#export SYSROOT=/tools/AGRreleases/yocto/jethro_20Feb2017/axxia-arm64-x9/tools/sysroots/aarch64-poky-linux
	#export SYSROOT=/tools/AGRreleases/yocto/tools_jethro/armv8/axxia-image-large/sysroots/aarch64-poky-linux
	#export SYSROOT=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm64-x9/tools/sysroots/aarch64-axxia-linux
	export SYSROOT=/tools/AGRreleases/yocto/morty/axxia_gen2_04apr2018/axxia-arm64-x9/tools/sysroots/aarch64-axxia-linux
	export ARCH=arm64
	export PATH=/workspace/sw/mbykowsx/lionfish/dtc:$PATH
	#export YOCTO=/workspace/sw/mbykowsx/lionfish/yocto
elif [[ $TARGET == armv8_new_server ]]; then
	source /tools/AGRreleases/yocto/thud/axxia_gen2_meta_1.10/axxia-x9-rt/tools/austin.env
elif [[ $TARGET == armv7 ]]; then
	#build for axm55xx
	#export PATH=/tools/AGRreleases/yocto/jethro_12Sep2016/axxia-arm/tools/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux:$PATH
	#export PATH=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm-x7/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/arm-axxia-linux:$PATH
	export PATH=/tools/AGRreleases/yocto/morty/axxia_gen2_04apr2018/axxia-arm-x7/tools/sysroots/x86_64-axxiasdk-linux/usr/bin/arm-axxia-linux:$PATH
	export CROSS_COMPILE=arm-axxia-linux-
	#export SYSROOT=/tools/AGRreleases/yocto/jethro_11Jul2016/axxia-arm/tools/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/
	#export SYSROOT=/tools/AGRreleases/yocto/morty/2018_01_26/axxia-arm-x7/tools/sysroots/armv7ve-neon-axxia-linux-gnueabi/
	export SYSROOT=/tools/AGRreleases/yocto/morty/axxia_gen2_04apr2018/axxia-arm-x7/tools/sysroots/armv7ve-neon-axxia-linux-gnueabi
	export ARCH=arm
	export PATH=/workspace/sw/mbykowsx/lionfish/dtc:$PATH
fi

#for ASE
#export PATH=/tools/AGRtools/jdk-1.7.0_51-x86_64/bin/:$PATH
#export JAVA_HOME=/tools/AGRtools/jdk-1.7.0_51-x86_64
export ASE_INSTALL=/workspace/sw/mbykowsx/lionfish/ase_rte/ase
export JAVA_HOME=/tools/AGRtools/jdk1.8.0_141-x64
export JAVA_OPTS="-XX:MaxHeapSize=512m"
export PATH=$JAVA_HOME/bin:$PATH
#export LD_LIBRARY_PATH=/home/mbykowsx/bin/pixman/lib:$LD_LIBRARY_PATH
#export PKG_CONFIG_PATH=/home/mbykowsx/bin/pixman/lib/pkgconfig:$PKG_CONFIG_PATH
#export LD_LIBRARY_PATH=/home/mbykowsx/bin/freetype2/lib/:$LD_LIBRARY_PATH
#export PKG_CONFIG_PATH=/home/mbykowsx/bin/freetype2/lib/pkgconfig:$PKG_CONFIG_PATH


# to be amanded upon a working copy of svn
#sshfs lsi:/home/mbykowsx/lionfish lionfish

#cd $XSTEP_INSTALL_DIR && ./XStepClient
#export RLM_LICENSE=6053@10.96.99.23

#export PATH="$PATH:/workspace/sw/mbykowsx/lionfish/xstep/tools/bin"
#export XSTEP_PATH="/workspace/sw/mbykowsx/lionfish/xstep/tools/bin"
_PS1 ()
{
    local PRE= NAME="$1" LENGTH="$2";
    [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
        PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
    ((${#NAME}>$LENGTH)) && NAME="/...${NAME:$[${#NAME}-LENGTH+4]}";
    echo "$PRE$NAME"
}
_PS11 ()
{
    local dir="$1"
    last_but_one=$(basename $(dirname $dir))
    if [[ $last_but_one == home ]]; then
        last_but_one="/$last_but_one"
    fi
    last=$(basename $dir)
    echo $last_but_one/$last
}
PS1='\u@\h:$(_PS11 "$PWD")\$ '

#export PS1="\u@\h: \w\n$ "
#export PROMPT_DIRTRIM=2
export http_proxy=http://proxy-chain.intel.com:911
export HTTP_PROXY=$http_proxy
export https_proxy=http://proxy-chain.intel.com:912
export HTTPS_PROXY=$https_proxy
export ftp_proxy=http://proxy-chain.intel.com:911
export FTP_PROXY=$ftp_proxy
export socks_proxy=http://proxy-chain.intel.com:1080
export SOCKS_PROXY=$socks_proxy
export no_proxy=intel.com,.intel.com,localhost,127.0.0.1
export NO_PROXY=$no_proxy
#export http_proxy=proxy-mu.intel.com:911
#export https_proxy=proxy-mu.intel.com:911

#export LD_LIBRARY_PATH=/home/mbykowsx/bin/lib:/home/mbykowsx/bin/lib/lib:${LD_LIBRARY_PATH}
#export PATH=/home/mbykowsx/bin/tmux-2.3:$PATH
#lib from marekm. I use it mostly if not only for git svn
#export LD_LIBRARY_PATH=/home/mbykowsx/bin/lib-from-marekm:${LD_LIBRARY_PATH}
alias gdb="LD_PRELOAD=/home/mbykowsx/bin/lib/lib/libc-2.15.so /home/mbykowsx/gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-gdb"

source ~/.bashrc_mine
source ~/.bashrc_uboot
#source ~/.bashrc_snr
#source ~/.mareksm
