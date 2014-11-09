module WordNik
	def self.find_word
		url = "http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=7&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
		response_hash = HTTParty.get(url)
		word = response_hash['word']
	end
end


