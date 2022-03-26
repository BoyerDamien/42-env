#! /bin/bash

# Exit if error
set -e

# Variables
ENV_NAME="42env"
BUILD_PATH="$HOME/code/42-env"
VIRTUAL_HOME_PATH="$HOME/virtualhome"

# Check docker image
if [[ -z $(docker images | grep $ENV_NAME) ]]
then
	cd $BUILD_PATH && docker build -t $ENV_NAME .
fi

if [[ ! -d $VIRTUAL_HOME_PATH/.ssh ]]
then
	# Create virtualhome
	mkdir -p $VIRTUAL_HOME_PATH 
	cp -rf ~/.ssh $VIRTUAL_HOME_PATH
fi

docker run -it \
	--mount src="${VIRTUAL_HOME_PATH}",target=/root,type=bind \
	$ENV_NAME
