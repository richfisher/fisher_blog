require 'test_helper'

class Panel::CategoriesControllerTest < ActionController::TestCase
  setup do
    @panel_category = panel_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:panel_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create panel_category" do
    assert_difference('Panel::Category.count') do
      post :create, panel_category: {  }
    end

    assert_redirected_to panel_category_path(assigns(:panel_category))
  end

  test "should show panel_category" do
    get :show, id: @panel_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @panel_category
    assert_response :success
  end

  test "should update panel_category" do
    put :update, id: @panel_category, panel_category: {  }
    assert_redirected_to panel_category_path(assigns(:panel_category))
  end

  test "should destroy panel_category" do
    assert_difference('Panel::Category.count', -1) do
      delete :destroy, id: @panel_category
    end

    assert_redirected_to panel_categories_path
  end
end
