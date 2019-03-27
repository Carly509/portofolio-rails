def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
 
    if @post.save
      redirect post_path(@post)
    else
      render :new
    end
  end