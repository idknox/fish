require 'sinatra'
require_relative 'fish_model'

class FishApp < Sinatra::Base


  def initialize
    super
    @fish = [
      {fish: "Pufferfish"},
      {fish: "Clownfish", scientific: "Amphiprioninae", salt_fresh: "salt water", description: "Nemo was a clownfish. They are widely loved.", photo: "<img src='http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Clown_fish_in_the_Andaman_Coral_Reef.jpg/250px-Clown_fish_in_the_Andaman_Coral_Reef.jpg'>", wiki: "http://en.wikipedia.org/wiki/Amphiprioninae"},
      {fish: "Swordfish"}]
  end

  get '/' do
    erb :homepage, :locals => {:fish => fish_list}

  end

  get '/search' do
    filter = params[:search_fish]
    if @fish.select{|fish| fish[:fish] == filter} == []
      erb :not_found
    else
      redirect "/#{filter}"
    end
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    @fish << {fish: params[:new_fish]}
    redirect "/#{params[:new_fish]}"
  end

  get '/:fish' do
    fish = @fish.select{|fishie| fishie[:fish] == params[:fish]}[0]
    erb :single_fish, :locals => {:fish_char => fish}
  end

end
