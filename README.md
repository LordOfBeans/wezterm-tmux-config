# wezterm-tmux-config

I use MacOS, but tmux's hotkeys don't seem to blend well with MacOS. For example, tmux uses CTRL + LeftArrow to resize a pane leftward, but that causes MacOS to boot me from the Terminal window. In addition, tmux doesn't appear to have support for the Command key as part of the leader.

## Details

I have my tmux leader set to Ctrl + A, although the default is Ctrl + B.

Currently, my setup is as follows:

* Wezterm maps Cmd + A to Ctrl + A, allowing me to use Cmd + A as the leader in tmux.
* Cmd + B -> r puts me in the resize-window key table, where I can press the arrow keys to resize the windows in tmux.
