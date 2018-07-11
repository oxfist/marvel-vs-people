class Superhero < ApplicationRecord
  validates :name, presence: true
  validates :character_id, presence: true
end
