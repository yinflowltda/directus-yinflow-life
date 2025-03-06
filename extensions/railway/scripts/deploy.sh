#!/bin/sh

if [ -z "$EXTENSIONS_PATH" ]; then
    echo "Error: Environment variable EXTENSIONS_PATH is not set."
    exit 1
else
    echo "EXTENSIONS_PATH is already set."
fi
if [ -z "$STORAGE_LOCAL_ROOT" ]; then
    echo "Error: Environment variable STORAGE_LOCAL_ROOT is not set."
    exit 1
else
    echo "STORAGE_LOCAL_ROOT is already set."
fi

if [ ! -d "$EXTENSIONS_PATH" ]; then
    echo "Directory 'EXTENSIONS_PATH' does not exist. Creating it now..."
    mkdir -p $EXTENSIONS_PATH
    if [ $? -eq 0 ]; then
        echo "Directory 'EXTENSIONS_PATH' created successfully."
    else
        echo "Failed to create directory 'EXTENSIONS_PATH'."
        exit 1
    fi
else
    echo "Directory 'EXTENSIONS_PATH' already exists."
    for dir in "$(pwd)/extensions/*"; do
        if [ "$(basename $dir)" != "railway" ]; then
            cp -Rv $dir "$EXTENSIONS_PATH/"
        fi
    done
fi

if [ ! -d "$STORAGE_LOCAL_ROOT" ]; then
    echo "Directory 'STORAGE_LOCAL_ROOT' does not exist. Creating it now..."
    mkdir -p $STORAGE_LOCAL_ROOT
    if [ $? -eq 0 ]; then
        echo "Directory 'STORAGE_LOCAL_ROOT' created successfully."
    else
        echo "Failed to create directory 'STORAGE_LOCAL_ROOT'."
        exit 1
    fi
else
    echo "Directory 'STORAGE_LOCAL_ROOT' already exists."
fi
