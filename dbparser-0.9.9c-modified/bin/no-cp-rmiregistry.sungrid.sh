#!/bin/tcsh -f

set JAVA_HOME=/usr/java/jdk1.5.0_12

echo "Killing any running RMI registry"
killall rmiregistry
sleep 5
echo "Starting new RMI registry"
$JAVA_HOME/bin/rmiregistry -J-Xmx128m &
sleep 5
echo "Starting Switchboard"
set sbCmd = ($java -server -cp $classpath -Xms100m -Xmx100m \
             $sbPolicy "$sbCodebase" $disableHttp $settingsProp \
             danbikel.parser.StartSwitchboard \
             -msg $sbMsgFile $inFiles -odir $outFileDir -logdir $logFileDir)
echo -n "       "
echo $sbCmd
echo `hostname` > $hostOutputFile
$sbCmd
killall rmiregistry

