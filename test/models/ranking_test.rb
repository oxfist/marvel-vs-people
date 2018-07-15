require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  test 'should initialize strarting_at to midnight on server start' do
    assert_equal Time.current.in_time_zone('America/Santiago').midnight,
                 Ranking.starting_at
  end

  test 'should update starting_at' do
    old_starting_at = Ranking.starting_at
    assert_changes 'Ranking.starting_at' do
      Ranking.update
    end
    # Restore old starting_at value in case this test runs first.
    Ranking.update(old_starting_at)
  end

  test 'should only allow one record' do
    ranking = Ranking.new(
      starting_at: Time.current.in_time_zone('America/Santiago')
    )
    refute ranking.valid?
  end
end
