class Posts::DownvotesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.unliked_by current_user
      end
end
