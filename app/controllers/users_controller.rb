class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def edit
      @user = current_user
      @provinces = Province.all
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to root_path, notice: 'Profile updated successfully.'
      else
        @provinces = Province.all
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:address, :postal_code, :province_id)
    end
  end
  