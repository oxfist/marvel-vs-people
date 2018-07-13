class Round < ApplicationRecord
  has_many :matches

  def winner
    matches.last.person_won? ? matches.last.person : matches.last.superhero
  end

  def self.run_round
    person = Person.random_fighter
    round = new

    # - If either person.blank? or superhero.blank? are true it's considered to
    #   not have fighters available.
    #
    # - person.defeated? is the main loop condition.
    until person.blank? || person.defeated? ||
          (superhero = Superhero.random_fighter).blank?
      # Persist the round only when the first match starts.
      round.save unless round.persisted?

      Match.start(person: person, superhero: superhero, round: round)
    end

    round
  end
end
