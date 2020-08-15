class UsersController < ApplicationController
  before_action :user_check
  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_check
    if params[:id] != current_user.id.to_s
      redirect_to root_path and return
    end 
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
