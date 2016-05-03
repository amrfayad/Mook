class LecturesController < InheritedResources::Base



 def down
    my_file = params[:file]
    send_file my_file
    render "new"
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

