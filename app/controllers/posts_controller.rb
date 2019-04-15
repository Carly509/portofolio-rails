class PostsController < ApplicationController
  before_action :require_login

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
  private
 
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end  