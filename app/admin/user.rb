ActiveAdmin.register User do


  index do
    selectable_column
    id_column
    column :email
    column :name
    column :gender
    column :is_student
    column :dob
    actions
  end
  permit_params :email, :name, :gender,:avatar,:is_student,:dob,:password

end