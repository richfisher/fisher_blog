require 'test_helper'

class Panel::ArticlesControllerTest < ActionController::TestCase
  setup do
    @panel_article = panel_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:panel_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create panel_article" do
    assert_difference('Panel::Article.count') do
      post :create, panel_article: {  }
    end

    assert_redirected_to panel_article_path(assigns(:panel_article))
  end

  test "should show panel_article" do
    get :show, id: @panel_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @panel_article
    assert_response :success
  end

  test "should update panel_article" do
    put :update, id: @panel_article, panel_article: {  }
    assert_redirected_to panel_article_path(assigns(:panel_article))
  end

  test "should destroy panel_article" do
    assert_difference('Panel::Article.count', -1) do
      delete :destroy, id: @panel_article
    end

    assert_redirected_to panel_articles_path
  end
end
