class User < ActiveRecord::Base
  acts_as_voter
  has_karma( :links, :as => :submitter)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username, :email

  has_many :links
  has_many :comments
  has_many :links

  def favorites
    favorites = []
    Favorite.where(user_id: self.id).each do |favorite|
      favorites << favorite.link_id
    end
    
  return favorites

  end

end
