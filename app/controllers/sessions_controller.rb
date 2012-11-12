class SessionsController < ApplicationController

  skip_before_filter :require_signin, :only => [:new, :create]
  def new
    @user = User.new
  end


  def create
    email = params[:session][:email]
    password = params[:session][:password]

    user = User.find_by_email(email)
    if user &&  user.authenticate(password)
      sign_in user     
      
 
      flash[:notice] = "sign in successful"
      redirect_to root_path
    else
      flash.now[:notice] = "sign in fails"
      render :new
    end
  end

  
  def destroy
    sign_out

    flash[:notice] = "sign out!"
    redirect_to root_path
  end


end
