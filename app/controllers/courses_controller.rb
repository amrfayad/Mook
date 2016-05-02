class CoursesController < InheritedResources::Base
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    def show
      @lectures = @course.lectures
    end
    
    
    
  private

    def course_params
      params.require(:course).permit(:title, :img, :user_id)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @course = Course.find(params[:id])
    end
    
    
end

