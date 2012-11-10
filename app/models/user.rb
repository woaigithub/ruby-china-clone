require 'digest'

class User < ActiveRecord::Base

  attr_accessor :password

  attr_accessible :username, :email, :password, :password_confirmation

#  has_secure_password

  validates :username, :presence => true, :length => { :in =>6..20 }
  validates :email, :presence => true
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true 

  has_many :topics


  before_save :encrypt_password

  private

  def encrypt_password
    self.password_digest=Digest::SHA1::hexdigest(self.password)
  end

end
