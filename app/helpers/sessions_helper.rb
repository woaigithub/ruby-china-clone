module SessionsHelper


  def sign_in(user)
    self.current_user = user
  end

  def sign_out
    current_user
  end

  def current_user
    @current_user ||= User.find_by_
  end

  def current_user=(user)
    @current_use = user
  end


end
