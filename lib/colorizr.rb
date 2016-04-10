class String
	def self.color_codes
		{
			black: 30, red: 31, green: 32, yellow: 33, blue: 34,
			magenta: 35, cyan: 36, light_gray: 37, dark_gray: 90,
			light_red: 91, light_green: 92, light_yellow: 93,
			light_blue: 94, light_magenta: 95, light_cyan: 96, white: 97
		}
	end

	# lists all available colors
	instance_eval do
		def colors
			color_codes.keys
		end
	end

	# gives an example of each color
	def sample_colors
	end

	# generates colors
	def self.create_colors
		color_codes.each do |key, value|
			self.send(:define_method, "#{key}") do
				return "\e[#{value}m#{self}\e[0m"
			end
		end
	end
	create_colors
end