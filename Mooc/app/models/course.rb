class Course < ActiveRecord::Base

	validates :title, presence: true, length: { maximum: 40 }
	validates :user_id , :presence  => true
	
  belongs_to :user
  has_many :lectures ,:dependent=>:delete_all
end
