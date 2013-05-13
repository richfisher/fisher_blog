class HomeController < ApplicationController
  def index
  	@articles = Article.order('id DESC').page(params[:page]).per(6)
  end
end
