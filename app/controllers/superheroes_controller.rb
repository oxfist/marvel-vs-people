class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    client = MarvelVsPeople::Application.config.marvel_client
    @superhero = client.character(params[:character_id].to_i)[0]
  end
end
