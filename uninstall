#!/usr/bin/env bash

USER_BIN_PATH="${HOME}/.local/bin"

EXECUTABLE_FILE_NAME="ecmd.sh"
EXECUTABLE_PATH="${USER_BIN_PATH}/${EXECUTABLE_FILE_NAME}"

# Remove user's executable
if [[ -f $EXECUTABLE_PATH ]]; then
    echo "Removing local executable: $EXECUTABLE_PATH"
    rm "$EXECUTABLE_PATH"
fi
