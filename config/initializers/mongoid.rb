Mongoid.raise_not_found_error = false

module BSON
  class ObjectId
    alias :to_json :to_s
    alias :as_json :to_s
  end
end
