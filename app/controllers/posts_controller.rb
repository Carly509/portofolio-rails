class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @comment = Comment.new
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  
  def create
    @post = Post.new(post_params)
  
      if @post.save
        session[:post_id]= @post.id
       flash[:notice] = "Done"
     redirect_to posts_path(@post)
   else
     
     flash[:danger] = "something wrong happened!"
     render :new
   end

  end

  # PATCH/PUT /posts/1
  
  def update
    Post.find_by(id:params[:post_id])
    if @post.update(post_params)
        redirect_to posts_path(@post) 
    else 
        flash[:danger]="error "
        redirect_to posts_path
    end
  
  end

  # DELETE /posts/1
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end
end
