class SessionsController < ApplicationController
    
    def home
    end
    
    def new
    end
    
    def instructor_homepage
    end
    
    def student_homepage
        @courses=@current_user.courses
    end

    def create
        form_email = params[:user][:email]
        form_pass = params[:user][:password]
        usertype=params[:user][:usertype]
    
        if usertype == 'Instructor'
            user = Instructor.find_by_email(form_email)
            if user && user.matches_password?(form_pass)
                session[:email] = user.email
                session[:usertype] = usertype
            redirect_to '/instructor_homepage'
            else
                flash[:warning]="Email or password incorrect"
                render 'new'
            end
        else
            user = Student.find_by_email(form_email)
            if user && user.matches_password?(form_pass)
                session[:email] = user.email
                session[:usertype] = usertype
                redirect_to '/student_homepage'
            else
                flash[:warning]="Email or password incorrect"
                render 'new'
            end
        end
    end
    
    def destroy
        session.delete(:email)
        redirect_to home_path
    end

end