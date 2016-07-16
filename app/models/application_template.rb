class ApplicationTemplate
  include Mongoid::Document

  embeds_many :variables
  embedded_in :application, inverse_of: :web
  embedded_in :application, inverse_of: :android
  embedded_in :application, inverse_of: :ios
end
