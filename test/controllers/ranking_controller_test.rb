require 'test_helper'

class RankingControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should reset ranking' do
    assert_changes 'MarvelVsPeople::Application.config.ranking_starting_at' do
      post ranking_reset_url
      assert_redirected_to root_url
      follow_redirect!
      assert_response :success
    end
  end
end
