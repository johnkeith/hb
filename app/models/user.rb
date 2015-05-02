class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  belongs_to :location

  after_create :create_user_profile

  private

  def create_user_profile
  	Profile.create(user_id: id)
  end
end
