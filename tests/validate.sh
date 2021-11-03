#!/usr/bin/env bash

if [ -z $SCING_HOME ]
then
    echo "Environment variable 'SCING_HOME' not defined."
    exit 1
fi

#hack: get dependency set up
ln -s ../modules/ modules

modules="BayesSpace Cluster Count"

for module_name in $modules
do

    echo "Validating ${module_name}..."

    java -jar ${SCING_HOME}/devtools/womtool.jar \
        validate \
        test.${module_name}.wdl \
        --inputs test.${module_name}.inputs.json


done

#hack: remove symblock link to dependency
unlink modules
