set -g default-terminal "screen-256color"
set -g history-limit 8192

# Use VI
set-window-option -g mode-keys vi

#set -g mouse-select-pane on

# Kill
unbind ^k
bind ^k confirm-before "kill-window"

unbind ^x
bind ^x kill-pane

# Reload config
unbind r
bind r source-file ~/.tmux.conf

# Horizontal and vertical splits
unbind '\'
bind '\' split-window -h
unbind -
bind - split-window

# Go to the last active window
bind-key C-b last-window

# Cycle through panes
unbind a
bind a select-pane -t :.+1

# Go to a specific pane
unbind ^t
bind ^t command-prompt "select-pane -t %%"

unbind h
bind h select-pane -L
unbind j
bind j select-pane -D
unbind k
bind k select-pane -U
unbind l
bind l select-pane -R

# Resize panes
unbind >
bind > resize-pane -R 8
unbind <
bind < resize-pane -L 8

unbind ^j
bind ^j resize-pane -D 4
unbind ^k
bind ^k resize-pane -U 4
unbind ^u
bind ^u resize-pane -D 1
unbind ^i
bind ^i resize-pane -U 1

# Set pane numbering to start from 1
set -g base-index 1
set -g pane-base-index 1

# Status bar
set -g status on
set -g status-interval 2
set -g status-utf8 on
set -g status-justify "centre"

set -g status-left-length 30

set -g status-bg colour234
set -g status-fg white

set-window-option -g window-status-fg white
set-window-option -g window-status-bg default

set-window-option -g window-status-current-fg colour148
set-window-option -g window-status-current-bg colour234

set -g message-bg colour234
set -g message-fg white

set-window-option -g clock-mode-colour green

# Only resize windows if a smaller client is currently viewing it
setw -g aggressive-resize on
