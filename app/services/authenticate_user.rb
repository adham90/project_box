class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password

  def initialize(email, password)
    @email    = email
    @password = password
  end

  def call
    return unless user
    user.regenerate_token
    user.token
  end

  private

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    raise Exceptions::InvalidCredentials
  end
end
