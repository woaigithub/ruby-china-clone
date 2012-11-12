class UsersController < ApplicationController

  skip_before_filter :require_signin, :only => [:new, :create, :show]

  def new
    @user = User.new
  end

  def create
    @user= User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:notice] = "sign up successful"
           
      redirect_to @user
    else
      flash.now[:notice] = "sign up fail"
      render :new
    end


  end


  def show

    @user = User.find(params[:id])
  end
end
