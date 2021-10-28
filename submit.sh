#!/bin/bash

usage()
{
cat << EOF
USAGE: `basename $0` [options]
    -k  service account key (e.g. secrets.json)
    -i  inputs file (e.g. sample.inputs.json)
    -l  labels file (e.g. labels.json)
    -o  options file (e.g. options.json)
EOF
}

while getopts "k:i:l:o:h" OPTION
do
    case $OPTION in
        k) service_account_key=$OPTARG ;;
        i) inputs_file=$OPTARG ;;
        l) labels_file=$OPTARG ;;
        o) options_file=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$service_account_key" ] || [ -z "$inputs_file" ] || [ -z "$labels_file" ] || [ -z "$options_file" ]
then
    usage
    exit 1
fi

cromwell-tools submit \
    --secrets-file ${service_account_key} \
    --wdl SpaceRanger.wdl \
    --inputs-files ${inputs_file} \
    --deps-file SpaceRanger.deps.zip \
    --label-file ${labels_file} \
    --options-file ${options_file}
