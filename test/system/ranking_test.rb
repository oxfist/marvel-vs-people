require 'application_system_test_case'

class RankingTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_url
    assert_selector 'tr', count: 3
  end

  test 'resetting the ranking' do
    visit root_url
    page.accept_confirm do
      click_on 'Reset', match: :first
    end

    assert_text 'Ranking was reset.'

    # Assert that scores have been reset.
    assert_text '1 MyString 0 0'
    assert_text '2 MyString 0 0'
  end
end
