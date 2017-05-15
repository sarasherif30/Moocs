class Lecture < ActiveRecord::Base

	validates :title , :presence => true , length: { maximum: 30}
    validates :content , :presence => true
	validates :course_id , :presence  => true
	
	mount_uploader :attachment, AttachmentUploader

	belongs_to :user
  	belongs_to :course
  	has_many :comments,:dependent=>:delete_all

  	acts_as_votable
end
