require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :id=>'tag'
    assert_response :success
  end
end
