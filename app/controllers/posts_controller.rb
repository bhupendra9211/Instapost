class PostsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create]
    before_action :is_owner?, only: [:edit, :update, :destroy]
    def index
        # @posts = Post.all
        #Now the new post will render
        @posts = Post.all.order('created_at DESC').includes(:user, comments: :user)

    end

    def new
        @post = Post.new
    end

    #Redirecting the user in the controller methods.........
    # def create
    #     @post = Post.find(params[:id])
    #     @post.create(post_params)
    #     redirect_to root_path
    # end

    def create
      @post = current_user.posts.create(post_params)
      if @post.valid?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
    #This method is for updating the post, it perfrom get action
    def edit
      @post = Post.find(params[:id])
    end

    # This is for Updading the post,It will call after edit method is called
    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      if @post.valid?
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # This is used for deleting the post, it perform delete action
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to root_path
    end


      
    private

    # def is_owner?
    #   if Post.find(params[:id]).user != current_user
    #     redirect_to root_path
    #   end
    # end
    def post_params
      params.require(:post).permit(:user_id, :photo, :description)
    end
    def is_owner?
      redirect_to root_path if Post.find(params[:id]).user != current_user
    end
      

end

