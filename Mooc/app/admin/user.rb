ActiveAdmin.register User do
  permit_params :name ,:email , :date_of_birth , :profile_picture, :gender, :password


  form do |f|
    f.inputs "New User" do
      
      f.input :name
      f.input :email
      f.input :date_of_birth
      f.input :profile_picture
      f.input :gender
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end 