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

  test 'should create a match' do
    assert_difference 'Match.count' do
      run_standard_match
    end
  end

  test 'should update person according to match results' do
    people(:one).update(defeated: false)

    # Force person loss.
    Random.stub(:rand, 0.4) do
      run_standard_match
      assert people(:one).defeated?
    end
  end

  test 'should always update superhero after a match' do
    superheroes(:one).update(fought: false)
    run_standard_match
    assert superheroes(:one).fought?
  end

  private

  def run_standard_match
    Match.start(
      person: people(:one),
      superhero: superheroes(:one),
      round: rounds(:one)
    )
  end
end
