class SessionsController < ApplicationController

	get '/new' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hex = api_response['palettes']['palette']['colors']['hex']
		erb :'sessions/new'
	end

	post '/' do
		user = User.new(params[:user])
		user.password = params[:password]
		user.save!
		redirect '/'
	end

	delete '/' do
		session[:current_user] = nil
		redirect '/'
	end

	get '/login' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hex = api_response['palettes']['palette']['colors']['hex']
		erb :'sessions/login'
	end

	post '/login' do
		redirect '/' unless user = User.find_by({username: params[:username]})
		if user.password == params[:password]
			session[:current_user] = user.id
			redirect '/'
		end
	end

end