class RoundsController < ApplicationController
  def index
    @rounds = Round.all.order(id: :desc)
  end

  def create
    round = Round.run_round
    redirect_to rounds_url, notice: round_finished_msg(round)
  end

  private

  def round_finished_msg(round)
    if !round.persisted?
      'No fighters were available.'
    else
      "Round finished with #{round.winner.name} winning."
    end
  end
end
