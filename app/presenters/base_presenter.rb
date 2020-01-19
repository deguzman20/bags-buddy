# Base Presenter
class BasePresenter < SimpleDeligator
  def initialize(model, view)
    @model = model
    @view = view
  end

  def h
    @view
  end

  def self.present(name)
    define_method(name) do
      @model
    end
  end
end
