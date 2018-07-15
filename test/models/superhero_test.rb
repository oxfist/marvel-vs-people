require 'test_helper'

class SuperheroTest < ActiveSupport::TestCase
  setup do
    @superhero = Superhero.new(
      name: 'Spider-Man',
      character_id: 12341234
    )
  end

  test 'should be valid' do
    assert @superhero.valid?
  end

  test 'name should be present' do
    @superhero.name = nil
    refute @superhero.valid?
  end

  test 'character_id should be present' do
    @superhero.character_id = nil
    refute @superhero.valid?
  end

  test 'should get a random fighter if available' do
    Superhero.update_all(fought: false)
    refute_nil Superhero.random_fighter
  end

  test 'should get nil if no fighters are available' do
    Superhero.update_all(fought: true)
    assert_nil Superhero.random_fighter
  end

  test 'should delete associated matches when superhero is destroyed' do
    superhero = superheroes(:one)
    matches = superhero.matches
    superhero.destroy
    matches.each do |match|
      assert match.destroyed?
    end
  end
end
