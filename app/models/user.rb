class User < ActiveRecord::Base
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items


  validates_presence_of :password, :username, :items 

  def authenticate?(pass)
    password == pass
  end

end
