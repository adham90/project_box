class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from Exceptions::InvalidCredentials do
    render json: { error: 'invalid credentials' }, status: :unauthorized
  end

  rescue_from Exceptions::InvalidToken do
    render json: { error: 'invalid token' }, status: :unauthorized
  end

  rescue_from Mongoid::Errors::DocumentNotFound do
    render json: { error: 'record not found' }, status: 404
  end

  rescue_from NameError, with: :error_occurred

  private

  def error_occurred(exception)
    render json: { error: exception.message }.to_json, status: 500
  end

  def record_invalid(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def authenticate_request
    @current_user = AuthorizeRequest.call(request.headers).result
  end
end
