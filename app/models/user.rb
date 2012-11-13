require 'digest'

class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  attr_accessible :username, :email, :password, :password_confirmation

#  has_secure_password

  validates :username, :presence => true, :length => { :in =>6..20 }, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true, :if => Proc.new{ |u| u.new_record? }
  validates :password_confirmation, :presence => true, :if => Proc.new{ |u| u.new_record? }

  has_many :topics
  has_many :comments


  before_save :encrypt_password, :if => :password_changed?

  def authenticate(password)
    self.password_digest==Digest::SHA1::hexdigest(password)
    
  end


  def password_changed?
    !@password.blank?

  end

  private

  def encrypt_password
    self.password_digest=Digest::SHA1::hexdigest(self.password)
  end

end
