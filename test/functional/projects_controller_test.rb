require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get add_new" do
    get :add_new
    assert_response :success
  end

end
