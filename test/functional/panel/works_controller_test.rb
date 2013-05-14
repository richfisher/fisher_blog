require 'test_helper'

class Panel::WorksControllerTest < ActionController::TestCase
  setup do
    @work = FactoryGirl.create(:work)
    sign_in :user, FactoryGirl.create(:user) 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post :create, work: {  }
    end

    assert_redirected_to panel_works_path
  end

  test "should get edit" do
    get :edit, id: @work
    assert_response :success
  end

  test "should update work" do
    put :update, id: @work, work: {  }
    assert_redirected_to panel_works_path
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete :destroy, id: @work
    end

    assert_redirected_to panel_works_path
  end
end
