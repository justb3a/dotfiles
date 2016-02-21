# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
	# check if we're in a git repo
	command git rev-parse --is-inside-work-tree &>/dev/null || return
	# check if it's dirty
	command git diff --quiet HEAD &>/dev/null

    if [[ "$?" == 1 ]]; then
		echo '%F{red} ✗%F{yellow})'
    else
		echo '%F{green} ✔%F{yellow})'
    fi
}

prompt_pure_git_status() {
	INDEX=$(command git status --porcelain -b 2> /dev/null)
	STATUS=""

	# untracked
	if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null); then
		STATUS="%F{cyan}✭$STATUS"
	fi

	# added
	if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
		STATUS="%F{green}✚$STATUS"
	elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
		STATUS="%F{green}✚$STATUS"
	fi

	# modified
	if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
		STATUS="%F{blue}✹$STATUS"
	elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
		STATUS="%F{blue}✹$STATUS"
	elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
		STATUS="%F{blue}✹$STATUS"
	fi

	# renamed
	if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
		STATUS="%F{magenta}➜$STATUS"
	fi

	# deleted
	if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
		STATUS="%F{red}✖$STATUS"
	elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
		STATUS="%F{red}✖$STATUS"
	elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
		STATUS="%F{red}✖$STATUS"
	fi

	# stashed
	# if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
	# 	STATUS="%F{grey}∴$STATUS"
	# fi

	# unmerged
	if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
		STATUS="%F{yellow}═$STATUS"
	fi

	# ahead
	if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
		STATUS="%F{blue}↑$STATUS"
	fi

	# behind
	if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
		STATUS="%F{blue}↓$STATUS"
	fi

	# diverged
	if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null); then
		STATUS="%F{blue}↕$STATUS"
	fi

	echo $STATUS
}

# displays the exec time of the last command if set threshold was exceeded
prompt_pure_cmd_exec_time() {
	local stop=$(date +%s)
	local start=${cmd_timestamp:-$stop}
	integer elapsed=$stop-$start
	(($elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5})) && echo ${elapsed}s
}

prompt_pure_preexec() {
	cmd_timestamp=$(date +%s)

	# shows the current dir and executed command in the title when a process is active
	print -Pn "\e]0;"
	echo -nE "$PWD:t: $2"
	print -Pn "\a"
}

# string length ignoring ansi escapes
prompt_pure_string_length() {
	echo ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}}
}

prompt_pure_precmd() {
	# shows the full path in the title
	print -Pn '\e]0;%~\a'

	# git info
	vcs_info

	local prompt_pure_preprompt='\n%F{blue}%~%F{yellow}$vcs_info_msg_0_`prompt_pure_git_dirty` `prompt_pure_git_status` $prompt_pure_username%f %F{yellow}`prompt_pure_cmd_exec_time`%f'
	print -P $prompt_pure_preprompt

	# check async if there is anything to pull
	(( ${PURE_GIT_PULL:-1} )) && {
		# check if we're in a git repo
		command git rev-parse --is-inside-work-tree &>/dev/null &&
		# check check if there is anything to pull
		command git fetch &>/dev/null &&
		# check if there is an upstream configured for this branch
		command git rev-parse --abbrev-ref @'{u}' &>/dev/null &&
		(( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) &&
		# some crazy ansi magic to inject the symbol into the previous line
		print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%f\e8"
		# print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%F{cyan}⇣%f\e8"
	} &!

	# reset value since `preexec` isn't always triggered
	unset cmd_timestamp
}


prompt_pure_setup() {
	# prevent percentage showing up
	# if output doesn't end with a newline
	export PROMPT_EOL_MARK=''

	prompt_opts=(cr subst percent)

	autoload -Uz add-zsh-hook
	autoload -Uz vcs_info

	add-zsh-hook precmd prompt_pure_precmd
	add-zsh-hook preexec prompt_pure_preexec

	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:git*' formats ' (%b'
	zstyle ':vcs_info:git*' actionformats ' (%b|%a'

	# show username@host if logged in through SSH
	[[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username='%n@%m '

	# prompt turns red if the previous command didn't exit with 0
	PROMPT='%(?.%F{magenta}.%F{red})❯%f '
}

prompt_pure_setup "$@"
