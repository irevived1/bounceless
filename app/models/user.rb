class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :issues
  has_many :comments
  before_create :assign_user_role

  def assign_user_role
    if User.all.count == 0
      self.role = "admin"
    end
    unless self.role != nil
      self.role = "student"
    end
  end
end
