class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vinyls
  has_many :rents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :profile_picture
end
