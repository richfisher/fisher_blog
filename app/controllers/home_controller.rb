class HomeController < ApplicationController
  def index
  	@articles = Article.order('id DESC').all
  end
end
