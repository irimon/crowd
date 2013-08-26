require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get look_for_project" do
    get :look_for_project
    assert_response :success
  end

  test "should get start_project" do
    get :start_project
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
