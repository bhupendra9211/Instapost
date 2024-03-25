class Posts::UpvotesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.liked_by current_user
      end

end
