class CoursesController < ApplicationController
  
    
    before_filter :enforce_login_instructor , except: [:index] 
    
    def index
        @courses = Course.all
    end
    
    def show
        @id = params[:id]
        @course = Course.find params[:id]
    end
    
    def new
     
    end
    
    def create
      @course = Course.new(permitted_params)
      if @course.save
        flash[:notice2] = "#{@course.name} was successfully created."
        redirect_to courses_path
      else
        flash[:notice] = @course.errors.full_messages.to_sentence
        render 'new' 
      end    
    end
    
    def edit
        @course = Course.find params[:id]
    end
    
    def update
      @course = Course.find params[:id]
      if @course.update_attributes(permitted_params)
        flash[:notice2] = "#{@course.name} was successfully updated."
        redirect_to course_path(@course)
      else
        flash[:notice] = @course.errors.full_messages.to_sentence
        render 'edit' # note, 'edit' template can access @course's field values!
      end

    end
    
    def destroy 
        id = params[:id]
        @course = Course.find(id)
        @course.destroy
        flash[:warning2] = "#{@course.name} was succesfully deleted!"
        redirect_to courses_path
    end
    
    def index_students
        id = params[:course_id]
        @course = Course.find id
        @students= @course.students
        @allstudents=Student.all - @students
    end
    
    def add_student
        id = params[:course_id]
        @course = Course.find id
        student = Student.find params[:student]
        @course.students << student
        redirect_to '/courses/'+id+'/index_students'
    end
    
    def remove_student
        id = params[:course_id]
        @course = Course.find id
        student = params[:data]
        @course.students.delete(student)
        redirect_to '/courses/'+id+'/index_students'
    end
    
    def permitted_params
        params.require(:course)
        params[:course] [:instructor_id]=@current_user.id
        params[:course].permit(:code, :name, :semester_offered, :catalog_data, :instructor_id)
    end
    
end