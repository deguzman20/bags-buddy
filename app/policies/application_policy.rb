# Base Policy Class
class ApplicationPolicy
  def rails_admin?(action)
    case action
      when :dashboard
        user.has_role? :admin
      when :index
        user.has_role? :admin
      when :show
        user.has_role? :admin
      when :new
        user.has_role? :admin
      when :edit
        user.has_role? :admin
      when :destroy
        user.has_role? :admin
      when :export
        user.has_role? :admin
      when :history
        user.has_role? :admin
      when :show_in_app
        user.has_role? :admin
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  # Hash of initial attributes for :new, :create and :update actions. This is optional
  def attributes_for(action)
  end

end
