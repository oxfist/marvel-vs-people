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
end
