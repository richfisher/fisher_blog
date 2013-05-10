require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get show" do
    category = FactoryGirl.create(:category)

    get :show, :id=>category.id
  end
end
