class HomepageController < ApplicationController

    def Home
        @posts = Post.all.order('created_At DESC')
        @post = Post.all
    end
end
