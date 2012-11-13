class UsersController < ApplicationController

  skip_before_filter :require_signin, :only => [:new, :create, :show]
  before_filter :require_owner, :only => [:edit, :update]

  def require_owner
    @user= User.find(params[:id])
    unless @user && @user.id==current_user.id 
      flash[:notice]="you must be the user's owner "
      redirect_to request.referer
    end
  end

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

  def edit

  end

  def update
    @user=User.find(params[:id])

#    @user.email=params[:user][:email]
#    @user.username=params[:user][:username]
#    if @user.update_attribute(:username, params[:user][:username])
    
    
    if @user.update_attributes(params[:user]) 


      flash[:notice]="update user successful"
      redirect_to @user
    else
      flash.now[:notice]="update user fail"
      render :edit
    end

  end


end
