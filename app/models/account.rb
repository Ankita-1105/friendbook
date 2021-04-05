class Account < ApplicationRecord
  has_many :posts, dependent:   :destroy
  has_many :likes

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,  :trackable

  mount_uploader :image, ImageUploader


  def full_name
  	"#{first_name} #{last_name}"	
  end

  def total_followers
  	Follower.where(follower_id: self.id).count
    
  end

  def total_following
  	Follower.where(following_id: self.id).count
  end

end
