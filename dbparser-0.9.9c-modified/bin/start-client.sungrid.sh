#!/bin/tcsh -f

set java = $1
set classpath = $2
set settingsFile = $3
set host = $4
set logDir = $5
set args = ($argv[6-$#argv])

set settingsProp = "-Dparser.settingsFile=$settingsFile"

set parent = ~/dbparser-0.9.9c-modified
set classes = $parent/classes
set jarFile = $parent/dbparser.jar
set clientPolicy = "-Djava.security.policy=file:///mnt/castor/seas_home/m/mitch/dbparser-0.9.9c-modified/policy-files/client.policy"
#set clientCodebase = "-Djava.rmi.server.codebase=file://$classes/"
set clientCodebase = "-Djava.rmi.server.codebase=file://$jarFile"
set disableHttp = "-Djava.rmi.server.disableHttp=true"

set startTime=`date +%s`

# start the parser
echo "Start $startTime" >> $logDir.timing.log

echo "Command:"
echo "$java -server -cp $classpath -Xms700m -Xmx700m $settingsProp $clientPolicy $clientCodebase $disableHttp danbikel.parser.Parser $args >& $logDir"

$java -server -cp $classpath -Xms700m -Xmx700m $settingsProp $clientPolicy \
    $clientCodebase $disableHttp \
    danbikel.parser.Parser $args >& $logDir


set endTime=`date +%s`

# start the parser
echo "End $endTime" >> $logDir.timing.log


