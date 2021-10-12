class MatchingElementNotFoundError < StandardError;end

class Array
	def gimme &block
		detected = detect(&block)
		if detected
			delete detected
			return detected
		else
			raise MatchingElementNotFoundError
		end
	end
end
