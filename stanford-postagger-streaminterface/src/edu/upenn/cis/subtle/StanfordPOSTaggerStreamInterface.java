/*
 Copyright (C) 2013 Constantine Lignos

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

package edu.upenn.cis.subtle;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;

import edu.stanford.nlp.ling.HasWord;
import edu.stanford.nlp.ling.TaggedWord;
import edu.stanford.nlp.tagger.maxent.MaxentTagger;

public class StanfordPOSTaggerStreamInterface {

	public static void main(String[] args) {
		// Check arguments
		if (args.length != 1) {
			System.err.println("Usage: StanfordPOSTaggerInterface modelfile");
			System.exit(1);
		}
		// Create the tagger
		MaxentTagger tagger = new MaxentTagger(args[0]);
		String divider = "_";

		// Tag from standard input
		BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
		String input;
		try {
			// Input must be one sentence per line
			while ((input = stdin.readLine()) != null) {
				for (List<HasWord> sentence: MaxentTagger.tokenizeText(new StringReader(input))) {
					List<TaggedWord> tokens = tagger.tagSentence(sentence);
					Iterator<TaggedWord> wordIter = tokens.iterator();
					while (wordIter.hasNext()) {
						TaggedWord word = wordIter.next();
						String wordText = word.toString(divider);
						System.out.print(wordText + (wordIter.hasNext() ? " " : ""));
					}
					// Newline after each sentence
					System.out.print("\n");
				}
				// Double newline when we've output all sentences
				System.out.print("\n");
			}

		} catch (IOException e) {
			// No need to do anything, we're just closing down.
		}
	}
}
