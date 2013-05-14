class TagsController < ApplicationController
  def show
    @articles = Article.where("tags REGEXP ?",params[:id].to_s).order('id DESC').all

    set_page_title "Tags: #{params[:id]}"
  end
end
