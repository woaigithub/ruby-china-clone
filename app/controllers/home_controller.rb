class HomeController < ApplicationController
  skip_before_filter :require_signin, :only => [:index]

  def index
    @nodes = Node.all 
  end

end
