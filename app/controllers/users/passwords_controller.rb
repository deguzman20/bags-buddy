# password controller
class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
    @user = current_user
  end

  # PUT /resource/password
  def update
    @user = User.find(current_user.id)
    if @user.update_password_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to edit_password_path, flash: { success: "Successfully updated password" }
    else
      render "edit"
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end
  # The path used after sending reset password instructions

  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  private

    def user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
end
