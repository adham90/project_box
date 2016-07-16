class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from Exceptions::InvalidCredentials do
    render json: { error: 'invalid credentials' }, status: :unauthorized
  end

  rescue_from Exceptions::InvalidToken do
    render json: { error: 'invalid token' }, status: :unauthorized
  end

  private

  def authenticate_request
    @current_user = AuthorizeRequest.call(request.headers).result
  end
end
