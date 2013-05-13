class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :tags, :title
  attr_accessible :created_at, :updated_at

  belongs_to :category

  def tag_array
  	self.tags.split(',') rescue []
  end

  def to_param
    "#{id} #{title.to_ascii}".parameterize
  end
end
