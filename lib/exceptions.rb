module Exceptions
  class AuthenticationError < StandardError; end
  class InvalidCredentials < AuthenticationError; end
  class InvalidToken < AuthenticationError; end
end
