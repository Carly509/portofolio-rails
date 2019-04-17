class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @posts = Post.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
        if @user.save
            session[:user_id]= @user.id
            flash[:success] = "Welcome, Start Posting!"
        redirect_to @user
    else 
        render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Updated Succesfully!'
  else 
      render 'edit'
  end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to root_path
  end

   # Follows a user.
   def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following #.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers #.paginate(page: params[:page])
    render 'show_follow'
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
