class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :tags, :title
  attr_accessible :created_at, :updated_at

  def tag_array
  	self.tags.split(',') rescue []
  end
end
