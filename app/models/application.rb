class Application
  include Mongoid::Document

  embeds_one :web,     class_name: 'ApplicationTemplate', inverse_of: :web
  embeds_one :android, class_name: 'ApplicationTemplate', inverse_of: :android
  embeds_one :ios,     class_name: 'ApplicationTemplate', inverse_of: :ios
  embeds_many :variables, inverse_of: :global_variables
  embeds_many :designs
  embeds_many :mockups

  field :name, type: String
  field :description, type: String
end
