#!/bin/bash

TARGET=${1:-index.html}

GIT_DIFF=$(git diff HEAD -- $TARGET)
echo "git diff target $TARGET with HEAD:"
echo "$GIT_DIFF"

function echoWarning() {
  LIGHT_YELLOW='\033[1;33m'
  NC='\033[0m' # No Color
  echo -e "${LIGHT_YELLOW}${1}${NC}"
}

if [ ! -z "$GIT_DIFF" ]; then
    echoWarning "Target $TARGET does not match. Please run `bash build.sh $TARGET` and recommit." 
    exit 1
fi

echo "Target $TARGET is up-to-date".
