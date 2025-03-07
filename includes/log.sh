#!/bin/bash

_getLogCategory() {
  case $1 in
    0)
      echo "MESSAGE"
      ;;
    1)
      echo "SUCCESS"
      ;;
    2)
      echo "ERROR"
      ;;
    *)
      echo "UNKNOWN"
      ;;
  esac
}

_writeLog() {
  text=$2
  echo "$(_getLogCategory $1) $text"
}
