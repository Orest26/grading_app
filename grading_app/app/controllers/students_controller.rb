class StudentsController < ApplicationController
  
    
    before_filter :enforce_login_instructor 
    def index
        @students = Student.all
    end
    
    def show
        id = params[:id]
        @student =Student.find id
    end
    
    def new
    end
    
    def create
      @student = Student.new(permitted_params)
      @student.valid?
      if @student.save
        flash[:notice2] = "#{@student.name + " " + @student.surname} was successfully created."
        redirect_to students_path
      else
        flash[:notice] = @student.errors.full_messages.to_sentence
        render 'new' 
      end    
    end
    
    def edit
        @student = Student.find params[:id]
    end
    
    def update
      @student = Student.find params[:id]
      @student.valid?
      if @student.update_attributes(permitted_params)
        flash[:notice2] = "#{@student.email} was successfully updated."
        redirect_to student_path(@student)
      else
        flash[:notice] = @student.errors.full_messages.to_sentence
        render 'edit' 
      end

    end
    
    def destroy 
        id = params[:id]
        @student = Student.find(id)
        @student.destroy
        flash[:warning] = "#{@student.email} was succesfully deleted!"
        redirect_to students_path
    end
    
    def permitted_params
        params.require(:student)
        params[:student].permit(:name, :surname, :email, :password)
    end
end