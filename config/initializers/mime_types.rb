ActionController::Renderers.add :json_api do |obj, options|
  self.content_type ||= Mime[:json_api]
  obj
end
