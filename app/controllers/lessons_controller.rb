class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]
  
  def show
  end
  
  private
  
  def current_course 
    @current_course ||= current_lesson.section.course 
  end
  
  def require_authorized_for_current_course
    if current_course.user != current_user && ! current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: 'Please Enroll In Course'
    end
  end
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end 
end
