#encoding: utf-8
class ArticlesController < ApplicationController
	def index
		@articles = Article.order('id DESC').all
	end

	def show
		@article = Article.find(params[:id])
	end
end
	

