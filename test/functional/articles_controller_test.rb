require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
  end

  test "should get show" do
    article = FactoryGirl.create(:article)

    get :show, :id=>article.id
  end
end
