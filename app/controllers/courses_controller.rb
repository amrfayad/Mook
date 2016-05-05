class CoursesController < InheritedResources::Base
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :is_instrucor, only: [:new, :edit , :destroy]
  
  def show
    @lectures = @course.lectures
  end
    
  private

  def course_params
    params.require(:course).permit(:title, :img, :user_id)
  end
    
  def is_instrucor
    if current_user.is_student?
       render :text => 'You Don\'t Have Permission To Use This Page', :status => '404'
    end
  end
 # Use callbacks to share common setup or constraints between actions.
  def set_category
    @course = Course.find(params[:id])
  end
end

