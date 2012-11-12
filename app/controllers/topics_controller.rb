class TopicsController < ApplicationController

  
  skip_before_filter :require_signin, :only => [:index, :show, :node]
  before_filter :require_owner, :only => [:edit, :update, :destroy]

  def require_owner
    @topic = Topic.find(params[:id])
    unless @topic && current_user.id==@topic.user_id
      flash[:notice]="you must be the topic's owner"
      redirect_to topic_path @topic
    end
  end
 

  def index
    page = params[:page]
    @topics = Topic.paginate(:page=>page,:per_page=>5)
                   .includes(:node).includes(:user)
                   .order("topics.updated_at desc")
  end


  def show
    @topic = Topic.find(params[:id])
    @comment_latest=@topic.comments.order("comments.updated_at desc").first
    @comment=Comment.new
  end

  
  def node
    page=params[:page]
    @node = Node.find(params[:id])
    @topics = @node.topics.includes(:user).paginate(:page=>page,:per_page=>5)
                   .order("topics.updated_at desc")

    render :index
  end


  def new
    @topic = Topic.new
    @nodes = Node.all
  end

  def create
  
    @node = Node.find(params[:topic][:node_id])
    @topic = @node.topics.build(:title => params[:topic][:title], 
                                :content => params[:topic][:content])
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "add topic successful"    
      redirect_to topic_path @topic
  
    else
      @nodes = Node.all
      flash.now[:notice] = "add topic fail"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @nodes = Node.all
  end

  def update
    @node=Node.find(params[:topic][:node_id])
    @topic=Topic.find(params[:id])
    @topic.title=params[:topic][:title]
    @topic.content=params[:topic][:content]
    @topic.node=@node
   
    if @topic.save
      flash[:notice]="update topic successful"
      redirect_to topic_path @topic
    else
      @nodes=Node.all
      flash.now[:notice]="update topic fail"

      render :edit

    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to root_path

  end
end
