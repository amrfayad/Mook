class CoursesController < InheritedResources::Base

  private

    def course_params
      params.require(:course).permit(:title, :img, :user_id)
    end
end

