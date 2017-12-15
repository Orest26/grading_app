class GradesController < ApplicationController
    before_filter :enforce_login
    before_filter :enforce_login_instructor , except: [:index, :show]
    def index
        @student = Student.find params[:student_id]
        @course = Course.find params[:course_id]
        @assessmentids = @course.assessmentitems.map(&:id)
        @grades = Grade.where('assessmentitem_id IN (:assessmentids) and student_id = :studentid', :assessmentids => @assessmentids, :studentid => @student.id)
    end
    
    def new
      @course = Course.find params[:course_id]
      @assessmentitems=@course.assessmentitems
      @grade=Grade.new
    end
    
    def create
      @course = Course.find params[:course_id]
      @assessmentitems=@course.assessmentitems
      @grade = Grade.new(permitted_params)
      
      if @grade.save
        flash[:notice2] = "Grade was successfully created."
        redirect_to '/courses/' + params[:course_id]+'/student/'+params[:student_id]+'/grades'
      else
        flash[:notice] = @grade.errors.full_messages.to_sentence
        render 'new' 
      end 
        
    end
    
     def edit
        @grade  = Grade.find params[:id]
        @course = Course.find params[:course_id]
        @assessmentitems=@course.assessmentitems
     end
    
    def update
     @course = Course.find params[:course_id]
      @assessmentitems=@course.assessmentitems
      @grade = Grade.find params[:id]
      if @grade.update_attributes(permitted_params)
        flash[:notice2] = "Grade was successfully updated."
        redirect_to '/courses/' + params[:course_id]+'/student/'+params[:student_id]+'/grades'
      else
        flash[:notice] = @grade.errors.full_messages.to_sentence
        render 'edit' 
      end
    end 
      
    def destroy
        id = params[:id]
        @grade = Grade.find(id)
        @grade.destroy
        flash[:warning2] = "Grade was succesfully deleted!"
        redirect_to '/courses/' + params[:course_id]+'/student/'+params[:student_id]+'/grades'
    end
    
    def permitted_params
        params.require(:grade)
        params[:grade] [:student_id]=params[:student_id]
        params[:grade].permit(:grade, :assessmentitem_id, :student_id)
    end
end