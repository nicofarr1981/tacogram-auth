class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user_exists = User.find_by({ "email" => @user["email"] })
    if @user_exists
      flash["notice"] = "Username already taken!"
      redirect_to "/users/new"
    else
      @user.save
      redirect_to "/posts"
    end
  end
end
