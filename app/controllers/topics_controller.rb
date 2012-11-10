class TopicsController < ApplicationController


  def index
#    @node = nil
    @topics = Topic.includes(:node).all
  end


  def show
    @topic = Topic.find(params[:id])
  end
  
  def node
    @node = Node.find(params[:id])
    @topics = @node.topics.all

    render :index
  end

end
