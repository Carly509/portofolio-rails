class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end  

  def create 
    @comment =Comment.new(param_category)
    if @comment.save
        redirect_to @comment

      else
        render 'new'
      end
  end

  def  show
   
  end


end