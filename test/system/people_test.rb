require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test 'visiting the index' do
    visit people_url
    assert_selector 'h1', text: 'People'
  end

  test 'creating a Person' do
    visit people_url
    click_on 'New Person', match: :first

    fill_in 'Name', with: @person.name
    fill_in 'Occupation', with: @person.occupation
    fill_in 'Quote', with: @person.quote
    fill_in 'Special ability', with: @person.special_ability
    click_on 'Create Person'

    assert_text 'Person was successfully created'
  end

  test 'updating a Person' do
    visit people_url
    click_link 'Edit', match: :first

    fill_in 'Name', with: @person.name
    fill_in 'Occupation', with: @person.occupation
    fill_in 'Quote', with: @person.quote
    fill_in 'Special ability', with: @person.special_ability
    click_on 'Update Person'

    assert_text 'Person was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Person' do
    visit people_url
    click_link 'Delete', match: :first
    click_on 'Confirm', match: :first

    assert_text 'Person was successfully destroyed'
  end

  test 'reviving a Person' do
    people(:one).update(defeated: true)
    visit people_url
    click_link 'Revive', match: :first
    click_on 'Confirm', match: :first

    assert_text(/.*was revived/)
  end
end
