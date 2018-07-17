require 'test_helper'

class SuperheroesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @superhero = superheroes(:one)
  end

  test 'should get index' do
    get superheroes_url
    assert_response :success
  end

  test 'should show superhero' do
    Marvel::Client.stub_any_instance(:character, MARVEL_API_FIXED_RESPONSE) do
      get superheroes_show_url(character_id: @superhero.character_id)
      assert_response :success
    end
  end

  test 'should filter superheroes by name' do
    skip 'TODO: implement'
  end

  test 'should not filter superheroes if search param is not present' do
    skip 'TODO: implement'
  end
end
