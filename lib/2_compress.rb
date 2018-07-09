# Run-length-encoding is a simple form of data compression:
#   if an element (e) occurs (n) consecutive times in input stream replace the consecutive
#   occurrences with a single pair (ne)
#
# Examples:
#   a    -> 1a
#   aa   -> 2a
#   aabb -> 2a2b
#   abc  -> 1a1b1ca

def compress(input_stream)
	splitted = input_stream.split('')
	if splitted.length == 0
		return ''
	else
		wa = [1] 
		splitted.each{ |a| 
			if wa[-1].is_a? Integer 
				wa = wa + [a]   
			elsif a.match(wa[-1]) 
				wa[-2] = wa[-2] + 1
			else
				wa = wa + [1] + [a]
			end  }
	into_word(wa)
	end 
end

def into_word (input)
	input.join("")
end
