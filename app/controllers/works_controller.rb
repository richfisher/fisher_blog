class WorksController < ApplicationController
	def index
		@works = Work.order('id DESC').all

    set_page_title 'Works'
	end
end
