require_relative 'category'

module Allmenus::Menus
  class Group
    include ::HappyMapper

    attribute :id, Integer
    element :name, String
    has_many :categories, Allmenus::Menus::Category
  end
end
