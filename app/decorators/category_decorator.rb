# category decorator
class CategoryDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def category_name
    content_tag :option, class: "category-#{id}", value: id do
      name
    end
  end
end
