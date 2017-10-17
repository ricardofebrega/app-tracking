#!/bin/bash

###############################################################
# do some prep work

#make it testable 
if [ -z $SERVICE_DIR ]; then export SERVICE_DIR=`pwd`; fi
if [ -z $ENV ]; then export ENV=IUHPC; fi

#cleanup
rm -f finished

# TODO - handle a case where this file already exists
if [ ! -e $HOME/.mrtrix.conf ]; then
    echo "NumberOfThreads: 16" > $HOME/.mrtrix.conf
fi

OPTS=""
if [ $HPC == "BIGRED2" ]; then
    OPTS="-v CCM=1 -l gres=ccm"
fi
jobid=`qsub $OPTS $SERVICE_DIR/submit.pbs`
echo $jobid > jobid
