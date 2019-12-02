# mailer
class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_smtp.subject
  #
  def order_smtp(email)
    user = User.find_by_email(email.to_s)
    order = Order.find_by_user_id(user.id)
    @order_products = OrderProduct.where(order_id: order.id)
    mail to: email.to_s
  end
end
