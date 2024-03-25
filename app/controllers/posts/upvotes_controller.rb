class Posts::UpvotesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.liked_by current_user
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("post_#{params[:post_id]}_container", partial: 'posts/likes', locals: { post: @post }) }
        end
      end

end
