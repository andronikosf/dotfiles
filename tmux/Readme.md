CHEATSHEET:
    - Synchronized panes: Sends commands to all panes
        <prefix> + g
        command: ```
                    bind-key g set-window-option synchronize-panes\; display-message "synchronize-panes is now #{?pane_synchronized,on,off}"
                 ```
