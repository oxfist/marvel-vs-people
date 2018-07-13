class Match < ApplicationRecord
  belongs_to :person
  belongs_to :round
  belongs_to :superhero

  validates :person_won, exclusion: { in: [nil] }

  class << self
    def start(args)
      person_won = winning_criterion
      args[:person].update(defeated: true) unless person_won
      args[:superhero].update(fought: true)
      create!(
        person: args[:person],
        superhero: args[:superhero],
        round: args[:round],
        person_won: person_won
      )
    end

    private

    def winning_criterion
      Random.rand >= 0.5
    end
  end
end
