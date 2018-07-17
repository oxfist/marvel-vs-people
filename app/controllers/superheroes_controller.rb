class SuperheroesController < ApplicationController
  def index
    @superheroes = if params[:search].blank?
                     Superhero.order(name: :asc).page(params[:page])
                   else
                     @search = params[:search]
                     Superhero.where('lower(name) LIKE ?',
                                     "%#{@search.downcase}%")
                              .order(name: :asc).page(params[:page])
                   end
  end

  def show
    client = MarvelVsPeople::Application.config.marvel_client
    @superhero = client.character(params[:character_id].to_i)[0]
  end
end
