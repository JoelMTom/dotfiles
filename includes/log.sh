#!/bin/bash

info_bg=6
info_fg=0
success_bg=2
success_fg=0
error_bg=1
error_fg=0

_writeLogColor() {
    tput setab ${2};tput setaf ${3};echo -n ${1};tput op;tput setaf ${2};
}

_getLogCategory() {
    case $1 in
        0)
            _writeLogColor "INFO:" ${info_bg} ${info_fg}
            ;;
        1)
            _writeLogColor "SUCCESS:" ${success_bg} ${success_fg}
            ;;
        2)
            _writeLogColor "ERROR:" ${error_bg} ${error_fg}
            ;;
        *)
            echo "UNKNOWN:"
            ;;
    esac
}

_writeLog() {
    text=$2
    echo -n "$(_getLogCategory $1) "
    echo "$text";tput op
}
