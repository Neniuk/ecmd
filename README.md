# ecmd

Edit Command, or "`ecmd`", is a tool to edit commands in your editor of choice (defined in `$EDITOR`, defaults to `nano`) without needing to copy and paste. You can edit and rerun the command previously ran, or pass in a command as input to edit.


## Installation

To install, clone the repository with `git clone <REPOSITORY_LINK>` and then run the installation script with the command `./install` while inside the repository's folder. The installation script will copy the `ecmd` script to your `~/.local/bin` folder (or create said folder if it doesn't exist) and then prompt you if you wish to let the installation script source the file in your `~/.bashrc` file (NOTE: It is necessary to source it in the `~/.bashrc` in order to be able to run the command through the shell). Please remember to also add `~/.local/bin` to your `PATH`, if you haven't done so already. After installing source your `~/.bashrc` again through the command `source ~/.bashrc`, after which the command `ecmd` should be available.

### Uninstall

To uninstall, run the uninstall script with the command `./uninstall` within the repository's folder. This will remove the script from `~/.local/bin` and remove the added line from your `~/.bashrc` file.
## Usage/Examples

### Running previous command
```bash
$ echo wow
wow

$ ecmd
###### EDITOR OPENS HERE ###### 
Press Enter to run (<CTRL + C> to cancel):
echo wow amazing        # Here you can see the edited command once you save & quit the editor
wow amazing             # Command is run
```

### Running inputted command
```bash
$ echo wow
wow

$ ecmd ls
###### EDITOR OPENS HERE ###### 
Press Enter to run (<CTRL + C> to cancel):
ls ../                  # Here you can see the edited command once you save & quit the editor
folder-1 folder-2       # Command is run
```

### Running ecmd in debug mode
```bash
$ echo wow
wow

$ DEBUG_MODE=1 ecmd
###### EDITOR OPENS HERE ###### 
[DEBUG] [2025-05-19THH:MM:SSZ]: Command input: ''
[DEBUG] [2025-05-19THH:MM:SSZ]: Command input length: 0
[DEBUG] [2025-05-19THH:MM:SSZ]: Previous command: echo wow
[DEBUG] [2025-05-19THH:MM:SSZ]: Created temporary file: /tmp/ecmd-edited-cmd-XXXXXX
[DEBUG] [2025-05-19THH:MM:SSZ]: Opening editor: nano
Press Enter to run (<CTRL + C> to cancel):
[DEBUG] [2025-05-19THH:MM:SSZ]: Backup of terminal state: XXXX:X:XX:XXXX:X:XX:XX:XX:X...
echo wow amazing
[DEBUG] [2025-05-19THH:MM:SSZ]: Restored terminal state: XXXX:X:XX:XXXX:X:XX:XX:XX:X...
[DEBUG] [2025-05-19THH:MM:SSZ]: Running command: echo wow amazing
wow amazing
[DEBUG] [2025-05-19THH:MM:SSZ]: Command executed: echo wow amazing

[CLEANUP]
[DEBUG] [2025-05-19THH:MM:SSZ]: Cleanup function called.
[DEBUG] [2025-05-19THH:MM:SSZ]: Cleanup of /tmp/ecmd-edited-cmd-XXXXXX finished.
[DEBUG] [2025-05-19THH:MM:SSZ]: Resetting traps.
```
