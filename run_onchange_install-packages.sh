#!/bin/bash

SOURCE_DIR=$(chezmoi source-path)

cd "$SOURCE_DIR" &&
	. "./scripts/utils_install" &&
	. "./scripts/utils"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -