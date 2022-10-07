class UserSessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def sign_in
    @user_session = UserSession.new
  end

  #Checking the login credentials
  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      render :sign_in
    end
  end

  #Used to logout the user who is signed in 
  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end

end
