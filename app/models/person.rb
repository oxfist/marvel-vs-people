class Person < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :superheroes, through: :matches

  validates :name, presence: true
  validates :occupation, presence: true
  validates :special_ability, presence: true
  validates :quote, presence: true

  alias opponents superheroes

  def self.random_fighter
    Person.where(defeated: false).order(Arel.sql('random()')).limit(1).first
  end
end
