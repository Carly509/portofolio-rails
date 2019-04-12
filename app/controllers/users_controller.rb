class UsersController < ApplicationController

  def home
  end

  def Index
    
  end

  def new
   @user = User.new
  end  

  def create
    @user = User.new(user_params)
 
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      # re-render the :new template WITHOUT throwing away the invalid @person
      render :new
    end

  end

    def destroy
    User.find(params[:id]).destroy
    redirect_to people_url
  end

  def attempt_login
    if params[:username].present? && params[:password_digest].present?
      found_user = User.where(:username => params[:username]).first 
     if found_user 
      authorized_user = found_user.authenticate(params[:password_digest])
     end
   end

    if authorized_user
      session[user_id] = authorized_user.id
      flash[:notice] = "You are now logged in"
    else
      flash.now[:notice] = "Invalid username/password"
      render ('login')
    end  
  end

  def logout
    session[:user_id] = nil 
    flash[:notice] = 'logged out'
    redirect_to(access_login_path)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password_digest)
  end
end  