class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  
  def index
    @users = User.all
  end

  # GET /users/1
 
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  
  def create
    @user = User.new(user_params)

    if @user.valid?
       @user.save
        session[:user_id]= @user.id
        flash[:notice] = "You're In"
      redirect_to user_path(@user)
    else
      # re-render the :new template WITHOUT throwing away the invalid @person
      flash[:danger] = "something wrong happened!"
      render :new
    end
  end

  # PATCH/PUT /users/1
  
  def update
    if @user.valid?
     @user.update(user_params)
    redirect_to user_path(@user)
  else
    # re-render the :new template WITHOUT throwing away the invalid @person
    render :edit
  end
  end

  # DELETE /users/1
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = 'User was successfully destroyed.'
       redirect_to "homepage#home"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
