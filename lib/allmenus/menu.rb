require_relative 'menus/group'
module Allmenus
  class Menu
    include ::HappyMapper

    attribute :id, Integer, tag: 'id'
    has_many :groups, Menus::Group

    def self.find(id)
      response = Allmenus::Connection.get({restaurant_id: id, type: 'menu'})
      self.parse(response.body)
    end
  end
end
