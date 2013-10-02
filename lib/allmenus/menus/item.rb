module Allmenus::Menus
  class Item
    include ::HappyMapper

    attribute :id, Integer, tag: 'id'
    element :name, String
    element :description, String
  end
end
