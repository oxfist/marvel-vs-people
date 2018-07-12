class Superhero < ApplicationRecord
  has_many :matches
  has_many :people, through: :matches

  validates :name, presence: true
  validates :character_id, presence: true

  alias opponents people
end
