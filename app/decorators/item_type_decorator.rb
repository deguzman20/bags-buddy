class ItemTypeDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all

  def item_type_name
    content_tag :option, class: "item-type-#{id}", value: id  do
      name
    end
  end
end
