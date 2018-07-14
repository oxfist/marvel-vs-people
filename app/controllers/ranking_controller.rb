class RankingController < ApplicationController
  def index
    @scores = (Person.all.map { |person| person.score(starting_at) })
              .sort { |a, b| b[:score] <=> a[:score] }
  end

  def reset
    MarvelVsPeople::Application.config.ranking_starting_at = Time.current
    redirect_to root_url, notice: 'Ranking was reset.'
  end

  private

  def starting_at
    MarvelVsPeople::Application.config.ranking_starting_at
  end
end
