class PicsController < ApplicationController
 before_action :find_pic, only: [:edit, :update, :show, :destroy]
 before_action :authentificate_user!, except: [:index, :show]

 
    def index
        @pics = Pic.all.order('created_At DESC')
    end

    def show 
        
    end

    def new
        @pic = current_user.pics.build
    end

    def create
        @pic = current_user.pics.build(pic_params)
        if @pic.save 
            redirect_to @pic, notice : "Posted!"
        else 
            render 'new'
        end
    end

    def edit
    end

    def update
        if @pic.update(pic_params)
            redirect_to @pic, notice: 'Updated Succesfully!'
        else 
            render 'edit'
        end
    end

    def destroy
        @pic.destroy
        redirect_to root_path
    end

    def upvote
        @pic.upvote_by current_user
        redirect_to :back
    end

    private

    def pic_params
        params.require(:pic).permit(:title, :description, :image)
    end

    def find_pic
        @pic = Pic.find(params[:id])
    end
    
     
    
end
