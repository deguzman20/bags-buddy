# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order/order_smtp
  def order_smtp
    OrderMailer.order_smtp
  end
end
