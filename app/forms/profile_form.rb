class ProfileForm
  include Virtus.model
  include ActiveModel::Model

  attribute :id, Integer
  attribute :first_name, String
  attribute :last_name, String
  attribute :email, String

  def initialize(attr = {})
    @user = User.find(attr[:id])
    if !attr[:id].nil?
      self[:first_name] = attr[:first_name].nil? ? @user.first_name : attr[:first_name]
      self[:last_name] = attr[:last_name].nil? ? @user.last_name : attr[:last_name]
      self[:email] = attr[:email].nil? ? @user.email : attr[:email]
    else
      super(attr)
    end
  end

  def update
    if valid?
      update_form
      true
    else
      false
    end
  end

  private

    def update_form
      @user.update_attributes(
        first_name: self[:first_name],
        last_name: self[:last_name],
        email: self[:email]
      )
    end
end
