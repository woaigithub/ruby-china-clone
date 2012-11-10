class Topic < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :node
end
