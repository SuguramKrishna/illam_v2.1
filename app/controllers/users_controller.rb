class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    # debugger
    if @user.save
      WelcomeWorker.new.perform params['user']
      flash[:success] = "Account registered!"
      redirect_to root_path
    else
      render :sign_up
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :role)
  end
end
