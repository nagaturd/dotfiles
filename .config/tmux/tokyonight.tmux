set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"

set -g @prefix_highlight_fg "#a9b1d6" 
set -g @prefix_highlight_bg "#232433" 

set -g status-interval 1
set -g status on
set -g status-justify left
set -g status-style bg="#232433",fg="#a9b1d6"

set -g pane-border-style bg="#232433",fg="#565f89"
set -g pane-active-border-style bg=default,fg="#a9b1d6"

set -g display-panes-colour "#565f89"
set -g display-panes-active-colour "#a9b1d6" 

setw -g clock-mode-colour "#7aa2f7" 

set -g message-style bg="#232433",fg="#a9b1d6"
set -g message-command-style bg="#232433",fg="#a9b1d6"

set -g @prefix_highlight_output_prefix "#[fg=#232433]#[bg=#7aa2f7]#[nobold]#[noitalics]#[nounderscore]#[bg=blue]#[fg=black]"
set -g @prefix_highlight_output_suffix ""
set -g @prefix_highlight_copy_mode_attr "fg=#232433,bg=#a9b1d6,bold"

set -g status-left "#[fg=#a9b1d6,bg=#232433,bold]  #S#[fg=#a9b1d6,bg=#232433,nobold,noitalics,nounderscore] "
set -g status-right "#{prefix_highlight}#[fg=#2a2b3d,bg=#232433,nobold,noitalics,nounderscore]#[fg=#a9b1d6,bg=#2a2b3d] %Y-%m-%d #[fg=#a9b1d6,bg=#2a2b3d,nobold,noitalics,nounderscore]|#[fg=#a9b1d6,bg=#2a2b3d] %H:%M #[fg=#32344a,bg=#2a2b3d,nobold,noitalics,nounderscore]#[fg=#a9b1d6,bg=#32344a,bold] #H "

set -g window-status-format "#[fg=#2a2b3d,bg=#232433,nobold,noitalics,nounderscore] #[fg=#a9b1d6,bg=#2a2b3d] #I #[fg=#a9b1d6,bg=#2a2b3d,nobold,noitalics,nounderscore]| #[fg=white,bg=#2a2b3d]#W #F#[fg=#2a2b3d,bg=#232433,nobold,noitalics,nounderscore]"
set -g window-status-current-format "#[fg=#32344a,bg=#232433,nobold,noitalics,nounderscore] #[fg=#a9b1d6,bg=#32344a] #I #[fg=#a9b1d6,bg=#32344a,nobold,noitalics,nounderscore]| #[fg=#a9b1d6,bg=#32344a]#W #F#[fg=#32344a,bg=#232433,nobold,noitalics,nounderscore]"
set -g window-status-separator ""
