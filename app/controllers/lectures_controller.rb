class LecturesController < InheritedResources::Base
 before_action :authenticate_user!, :except => [:index]
 before_action :is_instrucor, only: [:new, :edit , :destroy]
 def down
    my_file = Lecture.find(params[:file]).attachfile.path
    send_file my_file
 end
 def new
   $course = Course.find(params[:cid])
   @lecture = Lecture.new
 end
 def create
    @lecture = Lecture.new(lecture_params)
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to $course, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
 end
 def is_instrucor
    if current_user.is_student?
       render :text => 'You Don\'t Have Permission To Use This Page', :status => '404'
    end
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
