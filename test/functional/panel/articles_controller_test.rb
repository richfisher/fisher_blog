require 'test_helper'

class Panel::ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = FactoryGirl.create(:article)
    sign_in :user, FactoryGirl.create(:user) 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: {  }
    end

    assert_redirected_to panel_articles_path
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    put :update, id: @article, article: {  }
    assert_redirected_to panel_articles_path
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to panel_articles_path
  end
end
