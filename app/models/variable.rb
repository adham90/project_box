class Variable
  include Mongoid::Document

  embedded_in :application, inverse_of: :global_variables
  embedded_in :application_template

  # validates_uniqueness_of :name, scope: :application, if application.present?
  # validates_uniqueness_of :name, scope: :application_template, if application_template.present?

  field :name,  type: String
  field :value, type: String
end
