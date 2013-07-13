#!/usr/bin/bash
# -N BikelParserTrainer -cwd
echo "Hello world"
echo "Java is $JAVA"
echo "$JAVA $JAVA_BIGMEM -classpath $JAVA_CLASSPATH -Dparser.settingsFile=$TRAINING_SETTINGS_FILE danbikel.parser.Trainer -i $TRAINING_FILE -o $OBSERVED_FILE -od $OBJ_FILE"
$JAVA $JAVA_BIGMEM -classpath $JAVA_CLASSPATH -Dparser.settingsFile=$TRAINING_SETTINGS_FILE danbikel.parser.Trainer -i $TRAINING_FILE -o $OBSERVED_FILE -od $OBJ_FILE
ls
