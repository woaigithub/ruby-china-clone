class User < ActiveRecord::Base
 
  has_secure_password

  attr_accessible :username, :email, :password, :password_confirmation

  validates :username, :presence => true, :length => { :in =>6..20 }
  validates :email, :presence => true, :confirmation => true 
  validates :password, :presence => true
  validates :password_confirmation, :presence => true 

  has_many :topics

  before_save :encrypt_password

  private
  
  def encrypt_password
    
  end

end
