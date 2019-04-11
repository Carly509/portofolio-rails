class UsersController < ApplicationController

  def home
  end

  def new

  end  

  def create
    @user = Users.new(person_params)
 
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      # re-render the :new template WITHOUT throwing away the invalid @person
      render :new
    end

  end

    def destroy
    Person.find(params[:id]).destroy
    redirect_to people_url
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = Customer.where(:username => params[:username]).first || found_user = Contractual.where(:username => params[:username]).first
     if found_user 
      authorized_user = found_user.authenticate(params[:password])
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
end  