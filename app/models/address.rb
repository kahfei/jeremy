class Address < ActiveRecord::Base
	before_validation :ensure_valid_url, :clean_address

	validates :url,  :uniqueness => { :case_sensitive => false }
	validates :url, :presence => true
	
	
	def ensure_valid_url_old
		validates_format_of :url, :with => URI::regexp(%w(http https))
	end

	def ensure_valid_url
		validates_format_of :url, :with => /^(https?:\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/
	end

	def clean_address
		self.url = remove_extension(remove_http(correct_slash(remove_whitespace(self.url))))
	end

	def remove_http_old(string)
		string.gsub((%r|^(https?)?:\/\/[www.]*|),"")
	end

	def remove_http(string)
		string.gsub((%r|^(https?:\/\/)?(w{3}.)?|),"")
	end

	def remove_extension(string)
		string.gsub((%r|\/{1}.*|),"")
	end

	def correct_slash(string)
		string.gsub(%r|\\|,"/")
	end

	def remove_whitespace(string)
		string.gsub(%r|\s+|,"")
	end


end
