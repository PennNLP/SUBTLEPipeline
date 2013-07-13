#!/bin/sh 
# arguments: training_settings_file inputFile domain model
# Sungrid script to do training for the Bikel parser
# 
export PARSING_BASE=~/parserOutput
export JAVA=/usr/java/jdk1.5.0_12/bin/java
#export JAVA_BIGMEM="-Xmx512m -Xms512m"
export JAVA_BIGMEM="-Xmx1500m -Xms1500m"
export PARSER_BIN=~/dbparser-0.9.9c-modified/bin

#export JAVA_CLASSPATH=$HOME/dbparser-0.9.9c-modified/dbparser.jar
export JAVA_CLASSPATH="$HOME/dbparser-0.9.9c-modified/dbparser.jar:$HOME/dbparser-0.9.9c-modified/dbparser-ext.jar"
export DOMAIN=$1
export MODEL=$2
export SETTINGS_FILE=$3
export TRAINING_FILE=$4

cd $PARSING_BASE
cd $DOMAIN
mkdir model$MODEL
cd model$MODEL
echo In directory $PWD
qsub -cwd -N BikelParserTrainer2  -v "JAVA=$JAVA,JAVA_BIGMEM=$JAVA_BIGMEM,TRAINING_SETTINGS_FILE=$SETTINGS_FILE,TRAINING_FILE=$TRAINING_FILE,OBSERVED_FILE=$MODEL.observed,OBJ_FILE=$MODEL.obj,JAVA_CLASSPATH=$JAVA_CLASSPATH" $PARSER_BIN/trainer.sh

# End of script file
