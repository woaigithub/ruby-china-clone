class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.new(params[:user])

    if @user.save
      
      
      flash[:notice] = "sign up successful"
      redirect_to @user
    else
      flash[:notice] = "sign up fail"
      render :new
    end
  end

end