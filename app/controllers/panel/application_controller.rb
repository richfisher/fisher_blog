class Panel::ApplicationController < ApplicationController
	before_filter :authenticate_user!
	layout 'panel'
end
