module Allmenus
  class Restaurant
    include ::HappyMapper

    attribute :id, Integer, tag: 'id'
    element :name,  String, tag: 'restaurant_name'
    element :phone_number, String
    element :address, String
    element :city, String
    element :state, String
    element :zip_code, Integer
    attr_accessor :location

    def self.find(id)
      response = Allmenus::Connection.get({restaurant_id: id, type: 'info'})
      self.parse(response.body).tap do |r|
        r.location = Location.new(r.address, r.city, r.state, r.zip_code)
      end
    end
  end
end
