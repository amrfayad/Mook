ActiveAdmin.register Lecture do


  index do
    selectable_column
    id_column
    column :content
    column :title
    column :img

    actions
  end

  permit_params :title, :content, :user_id,:course_id,:img,:attachfile

end