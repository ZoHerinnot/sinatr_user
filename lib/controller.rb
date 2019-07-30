require 'gossip'
require 'bundler'
Bundler.require


class ApplicationController < Sinatra::Base

	get '/' do 	
		erb :index, locals: {gossips: Gossip.all} 
	end

	get '/gossips/new/' do 
		erb :new_gossip		 	
	end

	post '/gossips/new/' do 
		erb :new_gossip
		Gossip.new(params["gossip_author"],params["gossip_content"]).save 
		redirect '/' 
	end

	get '/gossips/:id' do 
		erb :show, locals: {gossips: Gossip.new(params[@author],params[@content]).find(params['id']), i: params['id']} 
	end
  
end	    