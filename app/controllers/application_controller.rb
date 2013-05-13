class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  protected

  def layout_by_resource
    if controller_name == 'home'
      "span9_span3"
    else
      "span12"
    end
  end
end
