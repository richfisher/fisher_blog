class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		@articles = @category.articles.all
	end
end
