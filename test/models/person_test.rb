require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Person.new(
      name: 'Alan Turing',
      occupation: 'Mathematics professor',
      quote: 'Thank me for Computer Science',
      special_ability: 'Decryption'
    )
  end

  test 'should be valid' do
    assert @person.valid?
  end

  test 'name should be present' do
    @person.name = nil
    refute @person.valid?
  end

  test 'occupation should be present' do
    @person.occupation = nil
    refute @person.valid?
  end

  test 'special ability should be present' do
    @person.special_ability = nil
    refute @person.valid?
  end

  test 'quote should be present' do
    @person.quote = nil
    refute @person.valid?
  end

  test 'should get a random fighter if available' do
    Person.update_all(defeated: false)
    refute_nil Person.random_fighter
  end

  test 'should get nil if no fighters are available' do
    Person.update_all(defeated: true)
    assert_nil Person.random_fighter
  end

  test 'should return score from matches after the specified date' do
    person_score = people(:one).score(Time.current.midnight)
    assert_equal 0, person_score[:wins]
    assert_equal 1, person_score[:losses]
    assert_equal -1, person_score[:score]
    assert_equal people(:one).name, person_score[:name]
  end

  test 'should return \'empty\' score if there are no matches after the '\
    'specified date' do
    person_score = people(:one).score(Time.current + 2.hours)
    assert_equal 0, person_score[:wins]
    assert_equal 0, person_score[:losses]
    assert_equal 0, person_score[:score]
    assert_equal people(:one).name, person_score[:name]
  end
end
