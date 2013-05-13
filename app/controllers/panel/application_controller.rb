class Panel::ApplicationController < ApplicationController
	layout 'span12'

	before_filter :authenticate_user!
end
