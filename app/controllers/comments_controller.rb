class CommentsController < ApplicationController

  skip_before_filter :require_signin, :only => [:index, :show]
  before_filter :require_owner, :only => [:new, :create, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end 

  def update

  end

  def destroy

  end
end
