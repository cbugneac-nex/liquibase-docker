#!/bin/bash
set -e

if type "$1" 2> /dev/null; then
  ## First argument is an actual OS command. Run it
  exec "$@"
else
  if [[ "$*" == *--defaultsFile* ]] || [[ "$*" == *--version* ]]; then
    ## Just run as-is
    /liquibase/liquibase "$@"
  else
    ## Include standard defaultsFile
    /liquibase/liquibase "--defaultsFile=/liquibase/liquibase.docker.properties" "$@"
  fi
fi