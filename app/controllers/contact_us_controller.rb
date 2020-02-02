# Contact Us Controller
class ContactUsController < ApplicationController
  def contact; end

  def add_contact
    contact = Pages::ContactUsService.call(params)
    render json: "Message Sent".to_json, status: :ok if contact
  end
end
