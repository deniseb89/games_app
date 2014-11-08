class SessionsController < ApplicationController

	get '/new' do
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