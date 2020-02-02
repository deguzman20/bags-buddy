module Pages
  class ContactUsService < ApplicationService
    attr_accessor :firstname, :lastname, :email, :subject, :message

    def initialize(attr = {})
      @firstname = attr[:firstname]
      @lastname = attr[:lastname]
      @email = attr[:email]
      @subject = attr[:subject]
      @message = attr[:message]
    end

    def call
      add_contact_us
    end

    private

      def add_contact_us
        ContactUs.create(first_name: @firstname, last_name: @lastname, email: @email, subject: @subject, message: @message)
      end
  end
end
