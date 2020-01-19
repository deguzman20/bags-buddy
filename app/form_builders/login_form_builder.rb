class LoginFormBuilder < ActionView::Helpers::FormBuilder
  %w[email password].each do |method_name|
    define_method("#{method_name}_field") do |name, *args|
      @template.content_tag(:div, class: "md-form") do
        @template.tag(:br) + super(name, *args)
      end
    end
  end

  def check_box(name, *args)
    @template.content_tag(:div) do
      @template.content_tag(:div, class: "form-check") do
        super(name, *args) + label(name)
      end
    end
  end
end
