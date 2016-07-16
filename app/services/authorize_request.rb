class AuthorizeRequest
  prepend SimpleCommand
  attr_reader :token, :uid

  def initialize(headers = {})
    @token = headers['Authorization']
    @uid   = headers['uid']
  end

  def call
    user
  end

  private

  def user
    user = User.where(token: token, email: uid).first
    raise Exceptions::InvalidToken unless user
    user
  end
end
