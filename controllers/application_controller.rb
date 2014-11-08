class ApplicationController < Sinatra::Base

	set :views, File.expand_path("../../views", __FILE__)
	set :public_folder, File.expand_path("../../public", __FILE__)
	enable :method_override

	get '/' do
		api_response = HTTParty.get("http://colourlovers.com/api/palettes/random")
		@title = api_response['palettes']['palette']['title']
		@hex = api_response['palettes']['palette']['colors']['hex']
		erb :index
	end

	not_found do
		halt 404, "I can't find that"
	end
end