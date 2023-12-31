class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
        session[:user_id] = user.id
        redirect_to user
      else
        # Create an error message.
        flash[:danger] = "Invalid email/password"
        redirect_to new_session_path
      end
    end
  
    def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to root_url
    end
  end