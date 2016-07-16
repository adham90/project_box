module Tokenable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_secure_token(attribute = :token)
      define_method("regenerate_#{attribute}") do
        update_attributes(attribute => self.class.generate_token)
      end

      before_create { send("#{attribute}=", self.class.generate_token) }
    end

    def generate_token
      SecureRandom.base64(20)
    end
  end
end
