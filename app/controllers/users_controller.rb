class UsersController < ApplicationController
  
  def profile
    @user = current_user
  end
  
  def update
     @user = current_user
    if @user.update(user_params)
      redirect_to :profile_users
    else
      render "profile"
    end
  end
  
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :encrypted_password, :introduction, :image )
  end
  
end
