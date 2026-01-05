alias cm="chezmoi"

# My FOLDERS
alias ..="cd .."
alias ...="cd"
alias cd..="cd .."
alias dot="cd ~/.dotfiles && v"
alias l="eza -l"
alias la="eza -la --icons --no-user"
alias tree="eza -T --git"
alias pro="cd ~/Projects"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yy="y"


# NVIM
alias vim='nvim' # default Neovim config
alias v='nvim' # default Neovim config

# OBSIDIAN
alias obs="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Brain"
alias oo="obs && v"
alias os="obs && v ./Scratchpad.md"
alias ow="obs && v ./WorkNotes.md"

# DEV
alias cl="clear"
alias clr="clear"
alias nrd="npm run dev"
alias nrs="npm run serve"
alias nrt="npm run test"
alias nrsw="nrs -w"
alias awsl="aws sso login --profile=nebula-prod"
alias awsll="aws sso login --profile=login"
alias neb="nebula packages:setup npm"
alias ld="lazydocker"
alias lg="lazygit"

# PYTHON
alias nebp="nebula packages:setup pip"
alias clrneb="nebula packages:teardown pip"
alias p="python"
alias py="python"
alias pe="pyenv"
alias ppd="pipenv run dev-server"
alias ppe="pipenv"
alias ppi="pipenv install"
alias ppid="pipenv install --dev"
alias pps="pipenv sync --dev"
alias ppt="pipenv run ./scripts/test"
alias pptt="pipenv run pytest -rw ./tests"
alias pptf="pipenv run pytest -rw ./tests -k"
alias ppts="pipenv run test-static"
alias python="python3"

# GIT
alias ga="git add"
alias gb="git checkout"
alias gc="git commit -m"
alias gcn="gn"
alias gcd="git checkout develop"
alias gcm="git checkout main"
alias gcma="git checkout master"
alias gcloc="git branch --merged | egrep -v '(^\*|main|master|dev)' | xargs git branch -d"
alias gdiff="git diff main | git-split-diffs --color | less -RFX"
alias gg="glola"
alias gl="git pull"
alias gla="git pull --autostash"
alias glola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gn="git checkout -b"
alias grom="git pull origin main --rebase --autostash"
alias gsh="git push"
alias gsf="git push --force"
alias gst="git status"
alias gz="git stash"
alias gza="gz apply"
alias gzm="git stash --message"
alias gzp="gz pop"
alias explain="gh copilot explain"

# OTHER
alias top="btop"
alias htop="btop"

# tmux
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tal="tmux ls"
alias tt="tmux"
alias tk="tmux kill-ses"
