class Work < ActiveRecord::Base
  attr_accessible :description, :link_url, :title, :picture

  mount_uploader :picture, WorkPictureUploader
end
