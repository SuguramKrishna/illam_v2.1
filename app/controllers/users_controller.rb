class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def sign_up
    @user = User.new 
  end
  
  # Storing the datas in the Model and performing Sidekiq
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

  # Permitting the values from the fields with the help of method
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :role)
  end
end
