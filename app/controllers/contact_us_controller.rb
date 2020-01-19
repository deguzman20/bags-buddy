class ContactUsController < ApplicationController
  def contact ;end

  def create
    render json: params
  end  

# private
#   def contact_params
#     params.require(:contact_us).permit(:first_name, :last_name, :subject, :message) 
#   end  
end
#   %form#contact-form{:action => "#", :method => "post"}
      