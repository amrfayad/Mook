class Course < ActiveRecord::Base
  belongs_to :user

  mount_uploader :img, CourseImageUploader

end
