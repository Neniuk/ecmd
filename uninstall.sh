#!/usr/bin/env bash

USER_BIN="${HOME}/.local/bin"

EXECUTABLE_FILE_NAME="ecmd"
EXECUTABLE_PATH="${USER_BIN}/${EXECUTABLE_FILE_NAME}"

# Remove user's executable
if [[ -f $EXECUTABLE_PATH ]]; then
    echo "Removing local executable: $EXECUTABLE_PATH"
    rm "$EXECUTABLE_PATH"
fi
