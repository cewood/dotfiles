#!/bin/bash


function run_action {
  if xautolock -"$1"
  then
    notify "SUCCESS running $1" "normal"
  else
    notify "ERROR running $1" "critical"
    exit 1
  fi
}

function notify {
  notify-send "Xautolock Toggle" "$1." --icon=dialog-information --urgency="$2"
}



ACTION=$1

case $ACTION in
disable)
  run_action "$ACTION"
  ;;
enable)
  run_action "$ACTION"
  ;;
toggle)
  run_action "$ACTION"
  ;;
*)
  echo "ERROR: unsupported action: ${ACTION}"
  exit 1
  ;;
esac
