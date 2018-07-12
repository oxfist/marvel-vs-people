class Match < ApplicationRecord
  belongs_to :person
  belongs_to :round
  belongs_to :superhero
end
