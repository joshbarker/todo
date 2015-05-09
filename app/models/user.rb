class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items

  validates_associated :items

  def authenticate?(pass)
    password == pass
  end

  # def admin?
  #  role == 'admin'
  # end
 
  # def moderator?
  #  role == 'moderator'
  # end

end
