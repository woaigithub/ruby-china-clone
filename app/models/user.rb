require 'digest'

class User < ActiveRecord::Base

  attr_accessor :password

  attr_accessible :username, :email, :password, :password_confirmation

#  has_secure_password

  validates :username, :presence => true, :length => { :in =>6..20 }, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true 

  has_many :topics
  has_many :comments


  before_save :encrypt_password

  def authenticate(password)
    self.password_digest==Digest::SHA1::hexdigest(password)
    
  end

  private

  def encrypt_password
    self.password_digest=Digest::SHA1::hexdigest(self.password)
  end

end
