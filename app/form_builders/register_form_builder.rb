class RegisterFormBuilder < ActionView::Helpers::FormBuilder
  %w[date email].each do |method_name|
    define_method("#{method_name}_field") do |name, *args|
      @template.content_tag(:div, class: "md-form mt-0") do
        @template.tag(:br) + super(name, *args)
      end
    end
  end

  def password_field(name, options = {})
    @template.content_tag(:div, class: "md-form") do
      @template.tag(:br) + super(name, options)
    end
  end
end
