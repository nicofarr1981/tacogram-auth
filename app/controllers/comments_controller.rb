class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def create
        @comment = Comment.new
        @comment["note"] = params["note"]
        #@comment["post_id"] = @post["id"]
        @comment["user_id"] = @current_user["id"]
        @comment.save
        redirect_to "/posts"
    end
end
