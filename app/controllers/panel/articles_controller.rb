class Panel::ArticlesController < ApplicationController
  def index
    @articles = Article.order('id DESC').all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      redirect_to panel_articles_path, notice: 'Article was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to panel_articles_path, notice: 'Article was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to panel_articles_url
  end
end
