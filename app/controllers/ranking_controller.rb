class RankingController < ApplicationController
  def index
    @scores = (Person.all.map { |person| person.score(Ranking.starting_at) })
              .sort { |a, b| b[:score] <=> a[:score] }
  end

  def reset
    Ranking.update
    redirect_to root_url, notice: 'Ranking was reset.'
  end
end
