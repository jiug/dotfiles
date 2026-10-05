if status is-interactive
	  # Commands to run in interactive sessions can go here
end
alias fiji='/home/hugo/Software/Fiji/fiji & disown'
alias zen='Software/zen/zen & disown'
alias obsidian='obsidian --no-sandbox & disown'
bind \cy accept-autosuggestion
set -gx PATH $PATH /home/hugo/Software/odin

# Launch nvim inside tmux to avoid double-stroke issue
function nvim
    tmux new-window -n nvim -a -c $PWD nvim $argv
end


