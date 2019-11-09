# brand decorator
class BrandDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def brand_name
    content_tag :option, class: "brand-#{id}", value: id do
      name
    end
  end
end
