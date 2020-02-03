# Profile Controller
class ProfilesController < ApplicationController
  def profile
    return redirect_to root_path unless user_signed_in?

    @profile_form = ProfileForm.new(id: current_user.id)
  end

  def update_successful
    redirect_to profile_path
    flash[:success] = "Successfuly Update"
  end

  def update_profile
    profile_form = ProfileForm.new(
      params[:profile_form].merge(id: current_user.id)
    ).update

    update_successful if profile_form
  end
end
