class Instructor::CoursesController < ApplicationController
    # !!!---INSTRUCTOR CONTROLLER---!!! 
    
    #Before action below ensures only logged in users can create courses
    before_action :authenticate_user!
    #With all new actions we create an empty template to represent the item in this case a course
    
    def new 
        @course = Course.new
    end
    
   
    def create 
        @course = current_user.courses.create(course_params)
        if @course.valid?
            redirect_to instructor_course_path(@course)
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show 
        @course = Course.find(params[:id])
    end
    
    private
    
    def course_params
        params.require(:course).permit(:title, :description, :cost)
    end
    
  
    
end
