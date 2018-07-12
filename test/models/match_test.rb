require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  setup do
    @match = Match.new(
      person: people(:one),
      superhero: superheroes(:one),
      round: rounds(:one),
      person_won: false
    )
  end

  test 'should be valid' do
    assert @match.valid?
  end

  test 'person_won should be present' do
    @match.person_won = nil
    refute @match.valid?
  end

  test 'should be associated to a Person instance' do
    @match.person = nil
    refute @match.valid?
  end

  test 'should be associated to a Superhero instance' do
    @match.superhero = nil
    refute @match.valid?
  end

  test 'should be associated to a Round instance' do
    @match.round = nil
    refute @match.valid?
  end
end
