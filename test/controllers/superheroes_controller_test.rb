require 'test_helper'

class SuperheroesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @superhero = superheroes(:one)
    @res = [
      Hashie::Mash.new(
        name: @superhero.name,
        comics: { items: [{ name: 'Best comic ever' }] },
        series: { items: [{ name: 'Best series ever' }] },
        events: { items: [{ name: 'Best event ever' }] }
      )
    ]
  end

  test 'should get index' do
    get superheroes_url
    assert_response :success
  end

  test 'should show superhero' do
    Marvel::Client.stub_any_instance(:character, @res) do
      get superheroes_show_url(character_id: @superhero.character_id)
      assert_response :success
    end
  end
end
