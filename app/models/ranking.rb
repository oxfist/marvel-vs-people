class Ranking < ApplicationRecord
  validate :single_record
  validates :starting_at, presence: true

  class << self
    def starting_at
      first.starting_at
    end

    def update(starting_at = Time.current.in_time_zone('America/Santiago'))
      delete_all
      create(starting_at: starting_at)
    end
  end

  private

  def single_record
    errors.add :base, 'Only one ranking date is permitted' if Ranking.count >= 1
  end
end
