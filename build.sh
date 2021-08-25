#!/bin/bash


# Clean build artefacts
if [ -d 'build' ]; then
	rm -rf 'build'
fi

mkdir --parents 'build'


# Write current timestamp into temporary include directory
INCLUDE_DIRECTORY=`mktemp --directory`
date --rfc-3339=seconds > "${INCLUDE_DIRECTORY}/date.inc"


# Preprocess template
m4 --include "${INCLUDE_DIRECTORY}" 'website/index.html.m4' > 'build/index.html'

