# Implement a class, `Oib`, that represents one OIB number.
#
# On instantiation `Oib` constructor will be called with an oib number(a string). Constructor should
# store the code and perform initial validation of code length and code format(all characters should
# be digits). If any of the preceding constraints are not met, the constructor should raise an
# `ArgumentError` exception with appropriate message:
#   - when the code is shorter than 11 characters, `Code is too short`
#   - when the code is longer than 11 characters, `Code is too long`
#   - when the code contains characters besides digits, `Code should contain only digits`
#
# Oib class should also expose one public method, `Oib#valid?`, which checks whether code satisfies
# mathematical properties for valid OIB number(is control digit correct or not).
#
# Procedure for calculating control code is described in
#   http://www.regos.hr/UserDocsImages/KONTROLA%20OIB-a.pdf.

class Oib
	def initialize(input)
		if input.length < 11
			raise ArgumentError, "Code is too short"
		end
		if input.length > 11
			raise ArgumentError, "Code is too long"
		end
		unless input.match?(/[0-9]{11}/)
			raise ArgumentError, "Code should contain only digits"
		end
		@woib = input.split("")
		@ctrl = Integer(@woib.pop)
	end
		
	def valid?
		res = Integer(@woib[0])+10
		@woib.drop(1).each { |n|
			res = res%10
			if res == 0
				res = 10
			end
			res = res*2
			res = res%11
			res = res + Integer(n)  }
		res = res%10
		if res == 0
			res = 10
		end
		res = res*2
		res = res%11
		diff = Integer(String(11- res).split("")[-1])
		return diff==@ctrl
	end	

end
