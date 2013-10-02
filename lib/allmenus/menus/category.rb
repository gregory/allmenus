require_relative 'item'
module Allmenus::Menus
  class Category
    include ::HappyMapper

    attribute :id, Integer
    element :name, String
    element :description, String
    has_many :items, Allmenus::Menus::Item
  end
end
