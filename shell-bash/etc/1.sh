#!/bin/bash

prepare-data

if [ $? = 0 ]
then
    process-data

    if [ $? = 0 ]
    then
	report-result
    fi
fi

