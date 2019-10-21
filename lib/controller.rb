require 'gossip'


class ApplicationController < Sinatra::Base

    get '/' do
        erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :new_gossip
    end

    get '/gossips/:id/' do
    potin = Gossip.find(params['id'])
    erb :show_gossip, locals: {gossip: potin}
    end

    post '/gossips/new/' do
        Gossip.new(params["gossip_author"], params["gossip_content"]).save
        puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
        puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
        redirect '/'
      end
end

