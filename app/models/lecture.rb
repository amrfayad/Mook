class Lecture < ActiveRecord::Base
  belongs_to :course
  mount_uploader :attachfile, FileUploader
  acts_as_votable
end
