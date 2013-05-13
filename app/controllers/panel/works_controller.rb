class Panel::WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(params[:work])

    if @work.save
      redirect_to panel_works_path, notice: 'Work was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @work = Work.find(params[:id])

    if @work.update_attributes(params[:work])
      redirect_to panel_works_path, notice: 'Work was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    redirect_to panel_works_url
  end
end
