class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true,  uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true,  length: 5..10
  validates :gender, inclusion: %w(male female)
  validate :date_of_birth_check
  # validates_processing_of :profile_picture
  # validate :profile_picture_size_validation
 

  mount_uploader :profile_picture, ImageUploader
    
 
  def date_of_birth_check
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the preasent")
    end
  end
  # private
  # def profile_picture_size_validation
  #   errors[:profile_picture] << "should be less than 500KB" if profile_picture.size > 0.5.megabytes
  # end

	has_many :courses ,:dependent=>:delete_all
	has_many :lectures ,:dependent=>:delete_all
  has_many :comment ,:dependent=>:delete_all
   acts_as_voter
end
