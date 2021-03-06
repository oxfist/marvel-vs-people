class RankingController < ApplicationController
  def index
    @scores = (Person.all.map { |person| person.score(Ranking.starting_at) })
              .sort do |a, b|
      if a[:score] == b[:score]
        b[:wins] <=> a[:wins]
      else
        b[:score] <=> a[:score]
      end
    end
  end

  def reset
    Ranking.update
    redirect_to root_url, notice: 'Ranking was reset.'
  end
end
