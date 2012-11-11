class TopicsController < ApplicationController


  before_filter :require_signin, :only => [:new, :create]

  def require_signin
    unless signed_in?
      flash[:notice]="you should be sign in first!"
      redirect_to signin_path
    end
  end

  def index
    page = params[:page]
    @topics = Topic.paginate(:page=>page,:per_page=>5).includes(:node).includes(:user)
  end


  def show
    @topic = Topic.find(params[:id])
  end
  
  def node
    page=params[:page]
    @node = Node.find(params[:id])
    @topics = @node.topics.includes(:user).paginate(:page=>page,:per_page=>5)

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


end
