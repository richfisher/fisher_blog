class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		@articles = @category.articles.all

    set_page_title "Category: #{@category.name}"
	end
end
