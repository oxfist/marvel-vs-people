class Person < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :superheroes, through: :matches

  validates :name, presence: true
  validates :occupation, presence: true
  validates :special_ability, presence: true
  validates :quote, presence: true

  alias opponents superheroes

  def score(starting_at)
    {
      name: name,
      wins: wins = matches.where(
        [
          "created_at >= '%s' AND person_won = %s", starting_at, true
        ]
      ).count,
      losses: losses = (matches.where(
        [
          "created_at >= '%s'", starting_at
        ]
      ).count - wins),
      score: wins - losses
    }
  end

  def self.random_fighter
    Person.where(defeated: false).order(Arel.sql('random()')).limit(1).first
  end
end
