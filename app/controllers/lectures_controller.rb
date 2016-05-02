class LecturesController < InheritedResources::Base

  
  
  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachfile, :course_id)
    end
end

