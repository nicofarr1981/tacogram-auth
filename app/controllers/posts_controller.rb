class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    if @current_user
      @post = Post.new
    else
      flash["notice"] = "Not logged in!"
      redirect_to "/posts"
    end
  end

  def create
    @comment = Comment.new
    @comment["note"] = params["note"]
    #@comment["post_id"] = @post["id"]
    @comment["user_id"] = @current_user["id"]
    @post = Post.new
    @post["body"] = params["post"]["body"]
    @post["image"] = params["post"]["image"]
    @post["user_id"] = @current_user["id"]
    @post.save
    redirect_to "/posts"
  end

end