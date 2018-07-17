require 'application_system_test_case'

class SuperheroesTest < ApplicationSystemTestCase
  setup do
    @superhero = superheroes(:one)
  end

  test 'visiting the index' do
    visit superheroes_url
    assert_selector 'h1', text: 'Superheroes'
  end

  test 'visiting superhero detail page' do
    Marvel::Client.stub_any_instance(:character, MARVEL_API_FIXED_RESPONSE) do
      visit superheroes_show_url(character_id: @superhero.character_id)
      assert_selector 'h2', text: @superhero.name
    end
  end

  test 'filtering superheroes' do
    visit superheroes_url
    fill_in 'Search', with: 'My'
    click_on 'Search', match: :first
    assert_text 'MyString'
    refute_text 'YourString'
  end

  test 'empty string on filter just shows all superheroes' do
    visit superheroes_url
    fill_in 'Search', with: ''
    click_on 'Search', match: :first
    assert_text 'MyString'
    assert_text 'YourString'
  end
end
