#!/bin/bash

# check if we should activate debugging
if [ -n "${DEBUG}" ]; then
  set -x
fi

# check if we are running in test mode
if [ -n "${TEST}" ]; then
  TEST=1
else
  TEST=0
fi

# set options
set -ue



##
# find all the directories
#  $1 should be the target dir
function getdirs {
  declare -a DIRS

  while IFS= read -r -d '' DIR
  do
    DIRS+=("${DIR}")
  done < <(find "$1" -type d -print0)

  echo "${DIRS[@]}"
}

##
# find any .stow-fold files
#  $1 should be the target dir
function getfolds {
  declare -a FOLDS

  while IFS= read -r -d '' FOLD
  do
    FOLDS+=("${FOLD}")
  done < <(find "$1" -type f -name .stow-fold -print0)

  echo "${FOLDS[@]}"
}

##
# prune directories list
#  $1 should be the target dir
function prunedirs {
  DIRS=( "$(getdirs "$1")" )
  FOLDS=( "$(getfolds "$1")" )

  # iterate over each fold
  for FOLD in ${FOLDS[*]}; do
    # iterate over each dir
    for DIR in ${DIRS[*]}; do
      if [[ "${DIR}" =~ ${FOLD%\/.stow-fold}/* ]]; then
        # remove the dir since it's meant to be folded
        DIRS=( "${DIRS[@]/$DIR}" )
      # check if the dir is the target dir
      elif [ "${DIR}" == "${1}" ]; then
        # remove the dir since it's the target/base
        DIRS=( "${DIRS[@]/$DIR}" )
      fi
    done
  done

  echo "${DIRS[@]}"
}

##
# check the target directory
#  $1 should be the target dir
function checktarget {
  # check that the target is a relative path
  if [[ ${1} =~ ^/.* ]]; then
    echo "ERROR: Please provide a relative path only!"
    exit 1
  elif [[ ${1} =~ .*/$ ]]; then
    echo "ERROR: Please remove trailing slash from the target!"
    exit 1
  fi

  while IFS= read -r -d '' DIR
  do
    [[ ${DIR} =~ ${1}$ ]] && return 0
  done < <(find . -maxdepth 1 -type d -regex "^./[a-zA-z0-9_-]*" -print0)

  exit 1
}

##
# make directories
#  $1 should be the target dir
function mkdirs {
  checktarget "$1"

  DIRS=( "$(prunedirs "$1")" )

  for DIR in ${DIRS[*]}; do
    if [ "${TEST}" -eq 1 ]; then
      echo "TEST: Would create directory - \"${DIR/${1}/..}\""
    else
      mkdir --parents --verbose "${DIR/${1}/..}"
    fi
  done
}



# run the script
mkdirs "$1"
