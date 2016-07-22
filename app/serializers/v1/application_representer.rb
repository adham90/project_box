module V1
  class ApplicationSerializer < Oat::Serializer
    adapter Oat::Adapters::Siren

    schema do
      link :self, href: item_url(item.id)
      property :name, item.name
      property :description, item.description
      entities :users, item.designs
    end

    protected

    # helper URL method
    def item_url(id)
      "https://api.com/application/#{id}"
    end
  end
end
