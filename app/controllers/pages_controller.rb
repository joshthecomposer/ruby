require "net/http"
require "json"

class PagesController < ApplicationController

  def home
    @pokemon = get_pokemon_data
  end

  def login
  end

  def get_pokemon_data()
    url = "https://pokeapi.co/api/v2/pokemon/"+rand(1..1000).to_s
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    return parsed
  end

end