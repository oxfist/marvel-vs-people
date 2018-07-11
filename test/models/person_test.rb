require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
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
end
