echo "( (S (VP (VB Try) (S (VP (TO to) (VP (VB add) (NP (JJ empty) (NNS categories)) (PP (TO to) (NP (DT this) (NN sentence))))))) (. .)) )" | java -Xmx256m -jar restore-ecs.jar run - --perceptron --ante_perceptron | perl -ne '/^ (\(.+\))/ && print "$1\n"'