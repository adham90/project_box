class Design
  include Mongoid::Document
  embedded_in :application
  field :name, type: String
end
