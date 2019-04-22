class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    layout 'admin'
  
    
  
    def index
      @users = User.sorted
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Created successfully.'
        redirect_to(users_path)
      else
        render('new')
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:notice] = 'user updated successfully.'
        redirect_to(users_path)
      else
        render('edit')
      end
    end
  
    def delete
      @user = User.find(params[:id])
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "user destroyed successfully."
      redirect_to(users_path)
    end
  
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
      end
  
    def user_params
      # Permit :password, but NOT :password_digest
      params.require(:user).permit(
        :email,
        :username,
        :password
      )
    end
  
  end
  