#!/bin/bash

if [ $POPULATE_CONTENT = "true" ]
then
  ./populate.sh
fi

kolibri start --foreground
