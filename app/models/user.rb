class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :rememberable, :recoverable, :validatable and :timeoutable
  devise :database_authenticatable, :registerable,
          :trackable, :authentication_keys => [:username]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me

  has_many :cards
  has_many :cardboxes

end
