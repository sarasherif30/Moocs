ActiveAdmin.register Lecture do
  permit_params :title ,:content, :attachment, :course_id ,:user_id
end 