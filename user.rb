class User

  def initialize(username, password)
    @username = username
    @password = password
    @stored_username="admin"
    @stored_password="admin"
    @logged_in = false
  end

  def admin?
    @username == @stored_username && @password == @stored_password
  end
end