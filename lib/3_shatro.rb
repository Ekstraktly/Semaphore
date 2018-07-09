# Implement translator to Satrovacki slang. In order to generate `satro` representation of the word
# translator should split the word on the first vowel, and then reverse the order of split parts. If
# word is (strictly) less than 3 characters long, skip the conversion to `shatro`.
#
# Examples
#   +---------------+---------------+---------------+---------------+
#   |  first vowel  |      split    |    reverse    |     shatro    |
#   +---------------+---------------+---------------+---------------+
#   |     zdravo    |     zdra vo   |     vo zdra   |     vozdra    |
#   |        ^      |               |               |               |
#   +---------------+---------------+---------------+---------------+
#   |    betonske   |   be tonske   |   tonske be   |    tonskebe   |
#   |     ^         |               |               |               |
#   +---------------+---------------+---------------+---------------+
#
# Method will be called with a string which contains series of words separated by a space
# character(eg. "krpa krpa sava sava") and it should return a string where each word is converted to
# Satrovacki slang.

def shatro(sentence)
	out = []
	words = sentence.split(" ")
	words.each{ |word|
		if word.length >= 3
			sw = word.split('')
			sp = sw.find{ |l| l.match(/[aeiou]/) }
			x = word.partition(sp)
			shat = into_word([x[2],x[0],x[1]])
			out = out +[shat]
		else 
			out = out + [word]
		end

	}
	into_sentence(out)
	
end

def into_word (input)
	input.join("")
end

def into_sentence(input)
	input.join(' ')
end