# Contact Us Controller
class ContactUsController < ApplicationController
  def contact; end

  def add_contact
    cart_product = Pages::ContactUsService.call(params)
    render json: "Message Sent".to_json
  end

  # private
  #   def contact_params
  #     params.require(:contact_us).permit(:first_name, :last_name, :subject, :message)
  #   end
end