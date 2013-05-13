require 'test_helper'

class Panel::CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = FactoryGirl.create(:category)
    sign_in :user, FactoryGirl.create(:user) 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: {  }
    end

    assert_redirected_to panel_categories_path
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    put :update, id: @category, category: {  }
    assert_redirected_to panel_categories_path
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to panel_categories_path
  end
end
