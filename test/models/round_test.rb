require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  setup do
    @round = rounds(:one)
  end

  test 'should return a person if the winner of the last match was a person' do
    @round.matches.last.update(person_won: true)
    assert_kind_of Person, @round.winner
  end

  test 'should return a superhero if the winner of the last match was a '\
    'superhero' do
    @round.matches.last.update(person_won: false)
    assert_kind_of Superhero, @round.winner
  end

  test 'should create matches if there are fighters available' do
    Person.update_all(defeated: false)
    Superhero.update_all(fought: false)
    assert_changes 'Match.count' do
      Round.run_round
    end
  end

  test 'should not create matches if there are no fighters available' do
    Person.update_all(defeated: true)
    Superhero.update_all(fought: true)
    assert_no_changes 'Match.count' do
      Round.run_round
    end
  end
end
