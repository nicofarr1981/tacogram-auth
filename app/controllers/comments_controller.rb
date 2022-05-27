class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new
        @comment["note"] = params["comment"]["body"]
        @comment["post_id"] = 0
        @comment["user_id"] = @current_user["id"]
        @comment.save
        redirect_to "/posts"
    end
end
