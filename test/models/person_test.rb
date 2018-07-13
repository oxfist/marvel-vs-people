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
end
