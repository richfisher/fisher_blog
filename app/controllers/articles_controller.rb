#encoding: utf-8
class ArticlesController < ApplicationController
	def index
		@articles = Article.order('id DESC').all

    set_page_title 'Articles'
	end

	def show
		@article = Article.find(params[:id])

		set_page_title @article.title
	end
end
	

