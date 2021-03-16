#!/bin/bash

# update kolibri-explore-plugin
if [ $EXPLORE_VERSION = "stable" ]
then
  pip install -U kolibri-explore-plugin
else
  ./build-plugin.sh
  pip install -f file://$PWD/kolibri-explore-plugin/dist kolibri-explore-plugin
fi

kolibri plugin enable kolibri.plugins.app
kolibri plugin disable kolibri.plugins.learn
kolibri plugin enable kolibri_explore_plugin

if [ $POPULATE_CONTENT = "true" ]
then
  ./populate.sh
fi

kolibri start --foreground
