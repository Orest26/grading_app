class InstructorsController < ApplicationController
  
    before_filter :enforce_login_instructor
      
    
    def edit
        @instructor = @current_user
        @password_mismatch=''

    end
    
    def update
      @instructor = @current_user
     
      if params[:instructor][:password] != params[:instructor][:password1] then
          @password_mismatch = 'Passwords do not match'
          render 'edit'
      
      elsif @instructor.update_attributes(permitted_params) then
        flash[:notice2] = "#{@instructor.email} was successfully updated."
        redirect_to edit_instructor_path(@instructor)
      else
        flash[:notice] = @instructor.errors.full_messages.to_sentence
        render 'edit' 
      end

    end
    
    def permitted_params
        params.require(:instructor)
        params[:instructor].permit(:name, :surname, :email, :password)
    end
    
end