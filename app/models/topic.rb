class Topic < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :node
  belongs_to :user

  validates :title, :presence =>true, :length => { :in => 5..20 }
  validates :content, :presence => true
  
end
