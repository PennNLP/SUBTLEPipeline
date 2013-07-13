This is a simple wrapper for the Stanford POS Tagger that reads from
standard input and writes to standard output. It uses the tagger's
built-in sentence splitting and tokenization. To deal with multiple
sentences in the input, the behavior is as follows:

If your input is:
You must tag this sentence. Yes, you must.

The output will be the following *three* lines, the last one empty:
You/PRP must/MD tag/VB this/DT sentence/NN ./.
Yes/UH ,/, you/PRP must/MD ./.


Thus it will output each sentence separated by a newline and then
output a final empty line to let you know that it's done with the
input.
