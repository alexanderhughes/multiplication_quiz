require 'test_helper'

class QuizControllerTest < ActionController::TestCase
  test "should get setup" do
    get :setup
    assert_response :success
  end

  test "should get respond" do
    get :respond
    assert_response :success
  end

  test "should get score" do
    get :score
    assert_response :success
  end

end
