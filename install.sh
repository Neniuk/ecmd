#!/usr/bin/env bash

# From http://stackoverflow.com/a/21188136/446554
get_abs_filename() {
    echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

USER_BIN_PATH="${HOME}/.local/bin"

INSTALL_SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
EXECUTABLE_FILE_NAME="ecmd"

EXECUTABLE_SOURCE_PATH=$(get_abs_filename "${INSTALL_SCRIPT_DIR}/${EXECUTABLE_FILE_NAME}")
EXECUTABLE_INSTALL_PATH="${USER_BIN}/${EXECUTABLE_FILE_NAME}"

# Check bin dir
if [ ! -d "$USER_BIN_PATH" ]; then
    echo "Creating $USER_BIN_PATH directory..."
    mkdir -p "$USER_BIN_PATH"
fi

# COpy to user bin dir
if [[ ! -f $EXECUTABLE_INSTALL_PATH ]]; then
    echo "Installing $EXECUTABLE_FILE_NAME to $EXECUTABLE_INSTALL_PATH"
    cp "$EXECUTABLE_SOURCE_PATH" "$EXECUTABLE_INSTALL_PATH"
    chmod +x "$EXECUTABLE_INSTALL_PATH"
elif [[ -f $EXECUTABLE_INSTALL_PATH ]]; then
    echo "WARN: $EXECUTABLE_INSTALL_PATH already exists. Not overwriting."
fi

# Check if user bin dir is in PATH, if not, warn the user
if [[ ":$PATH:" != *":$USER_BIN:"* ]]; then
    echo "WARNING: $USER_BIN is not in your PATH. Remember to add it to your PATH."
fi
