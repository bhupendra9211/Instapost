class PostsController < ApplicationController
    def index
    end
    def new
        @post = Post.new
    end
    # def create
    #     @post = Post.find(params[:id])
    #     @post.create(post_params)
    #     redirect_to root_path
    # end
end