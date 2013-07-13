#!/bin/tcsh -f

#source ~sgeadmin/sge/nlp/common/settings.sh

#set RSH = ssh

if ($#argv != 1) then
    echo "usage: <output file for host>"
endif

#set host = $1
setenv hostOutputFile $1

setenv dir `dirname $0`
setenv scriptDir `cd $dir  ; echo $cwd`

# script used by this script
setenv rmiregistryScript "$scriptDir/no-cp-rmiregistry.sungrid.sh"

echo `pwd`

echo Starting rmiregistry
qsub -j y -cwd -V -N rmiregistry $rmiregistryScript 
#set registryPid = $!
echo Meep
#echo Creating rmiregistry pid file $pidOutputFile
#echo "$registryPid " > $pidOutputFile
