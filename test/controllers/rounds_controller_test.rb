require 'test_helper'

class RoundsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get rounds_url
    assert_response :success
  end

  test 'should run rounds when POSTing to create endpoint' do
    assert_difference 'Round.count', 1 do
      assert_difference 'Match.count', 2 do
        Random.stub(:rand, 0.6) do
          post new_round_url
        end
      end
    end

    back_to_index_assertions
  end

  test 'should update person defeated attribute correctly' do
    people(:one).update_attribute(:defeated, true)

    Random.stub(:rand, 0.4) do
      post new_round_url
    end

    assert people(:two).defeated

    back_to_index_assertions
  end

  test 'should update superhero fought attribute correctly' do
    superheroes(:one).update_attribute(:fought, true)

    post new_round_url

    assert superheroes(:two).fought

    back_to_index_assertions
  end

  test 'should not create round if there are no people or superheroes '\
    'able to compete' do
    Person.update_all(defeated: true)
    Superhero.update_all(fought: true)

    assert_no_difference 'Round.count' do
      post new_round_url
    end

    back_to_index_assertions
  end

  test 'should not create round if there are no people able to compete' do
    Person.update_all(defeated: true)

    assert_no_difference 'Round.count' do
      post new_round_url
    end

    back_to_index_assertions
  end

  test 'should not create round if there are no superheroes able to compete' do
    Superhero.update_all(fought: true)

    assert_no_difference 'Round.count' do
      post new_round_url
    end

    back_to_index_assertions
  end

  private

  def back_to_index_assertions
    assert_redirected_to rounds_url
    follow_redirect!
    assert_response :success
  end
end
