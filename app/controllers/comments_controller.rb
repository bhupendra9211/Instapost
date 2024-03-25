class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:edit, :update, :destroy]
    before_action :is_owner?, only: [:edit, :update, :destroy]
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
        if @comment.save && @comment.valid?
          redirect_to root_path
        else
          flash[:alert] = "Invalid params"
          redirect_to root_path
        end
    end


    # def create
    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    #     if @comment.save && @comment.valid?
    #       redirect_to root_path
    #     else
    #       flash[:alert] = "Invalid params"
    #       redirect_to root_path
    #     end
    #   end


    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if @comment.valid?
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
    end
    

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_path 
    end
    
    private 
    def comment_params
        params.require(:comment).permit(:description, :post_id)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
    
    def set_comment
        @comment = @post.comments.find(params[:id])
    end
    
    def is_owner?
        redirect_to root_path if Comment.find(params[:id]).user != current_user
    end
    
end
