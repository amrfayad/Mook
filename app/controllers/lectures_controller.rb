class LecturesController < InheritedResources::Base


 def down
    my_file = Lecture.find(params[:file]).attachfile.path
    send_file my_file
 end

def upvote
  @lecture = Lecture.find(params[:id])
  @lecture.liked_by current_user
  @course = @lecture.course
  redirect_to @course
end

def downvote
  @lecture = Lecture.find(params[:id])
  @lecture.downvote_from current_user
  @course = @lecture.course
  redirect_to @course
end
  
  private
    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachfile, :course_id)
    end
end

