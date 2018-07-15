class Superhero < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :people, through: :matches

  validates :name, presence: true
  validates :character_id, presence: true

  alias opponents people

  def self.random_fighter
    Superhero.where(fought: false).order(Arel.sql('random()')).limit(1).first
  end
end
