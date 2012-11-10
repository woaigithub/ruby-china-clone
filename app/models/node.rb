class Node < ActiveRecord::Base
  attr_accessible :title

  has_many :topics
end
