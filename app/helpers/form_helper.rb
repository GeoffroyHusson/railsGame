module FormHelper
  def setup_user(user)
    user.location ||= Location.new
    user
  end
end