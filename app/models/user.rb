class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, 
  			 :trackable, :validatable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
