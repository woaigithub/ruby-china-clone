class CommentsController < ApplicationController

  skip_before_filter :require_signin, :only => [:index, :show]
  before_filter :require_owner, :only => [:edit, :update, :destroy]

  def require_owner
    @comment = Comment.find(params[:id])
    unless @comment && @comment.user_id==current_user.id
      flash[:notice]="you must be the comment's owner"
      redirect_to @comment.topic
    end
  end

  def index

  end

  def show

  end

  def new
    @comment=Comment.new
  end

  def create
    @topic=Topic.find(params[:topic_id])
    @comment=@topic.comments.build(:content => params[:comment][:content])
    @comment.user=current_user
    if @comment.save
      flash[:notice]="comment successful"
      redirect_to @topic
    else
      flash[:notice]="comment fail"
      redirect_to @topic
    end
  end

  def edit

  end 

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @topic=Topic.find(params[:topic_id])
    redirect_to @topic
  end
end
