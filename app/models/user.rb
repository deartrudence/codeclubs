class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :lessons, through: :profile
  acts_as_voter

  def admin?
    if profile.present?
      self.profile.role == 'admin'
    end  
  end
end
