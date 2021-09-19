#!/bin/bash

IFS=$'\n'

for LINE in `ifconfig -a`; do
  if [[ "$LINE" =~ ^[[:alnum:]]+\: ]]
  then
    echo "${BASH_REMATCH}"
  elif [[ "$LINE" =~ ^[[:space:]]+inet6?[[:space:]]([[:alnum:]\.\:])+ ]]
  then
    echo "${BASH_REMATCH}"
  fi
done
