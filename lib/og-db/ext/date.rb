require 'date'

class Date
	WALMART_DAYS_OF_WEEK = %w{Saturday Sunday Monday Tuesday Wednesday Thursday Friday}
	class NotASaturdayError < StandardError;end
	
	def self.parse_american_or_iso_never_european input_str
		input_str = String input_str
		values = self.scan_3_num_vals(input_str)
		
		# assume American
		if values.last.to_s.length == 4
			mm, dd, yyyy = values
		# assume iso
		elsif values.first.to_s.length == 4
			yyyy, mm, dd = values
		else
			raise ArgumentError.new "no probable yyyy value"
		end
		
		Date.new yyyy, mm, dd
	end
	def self.from_saturday *args
		args = Array args
		raise ArgumentError unless args.count == 2
		
		day_of_week = args.gimme{ |e| WALMART_DAYS_OF_WEEK.include? e }
		
		sat_date = args.shift
		sat_date = self.parse_american_or_iso_never_european(sat_date) unless sat_date.respond_to?(:to_date)
		
		raise(NotASaturdayError) unless sat_date.saturday?
		
		count_days_forward_from_saturday = WALMART_DAYS_OF_WEEK.index day_of_week
		sat_date + count_days_forward_from_saturday
	end
	private
	def self.scan_3_num_vals input_str
		input_str = String input_str
		values = input_str.scan(/\d+/)
		raise "parse error: #{ values.count } values in `#{ input_str }`" unless values.count == 3
		
		values.map &:to_i
	end
end