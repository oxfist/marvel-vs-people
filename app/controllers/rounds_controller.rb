class RoundsController < ApplicationController
  def index
    @rounds = Round.all.order(id: :desc)
  end

  def create
    superhero = random_superhero
    person = random_person
    round = Round.new
    until person.blank? || person.defeated? || superhero.blank?
      round.save
      person_won = Random.rand >= 0.5

      Match.create!(
        person: person,
        superhero: superhero,
        round: round,
        person_won: person_won
      )

      superhero.fought = true
      superhero.save

      unless person_won
        person.defeated = true
        person.save
        break
      end

      superhero = random_superhero
    end
    redirect_to action: :index
  end

  private

  # TODO: move method to each respective model
  def random_person
    Person.where(defeated: false).order(Arel.sql('random()')).limit(1).first
  end

  def random_superhero
    Superhero.where(fought: false).order(Arel.sql('random()')).limit(1).first
  end
end
