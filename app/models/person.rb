class Person < ApplicationRecord
  validates :name, presence: true
  validates :occupation, presence: true
  validates :special_ability, presence: true
  validates :quote, presence: true
end
