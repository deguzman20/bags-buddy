namespace :order do
  desc "Task for order"
  task shipped: :environment do
    OrderProduct.select do |op|
      !op.product_id.nil? && !op.batch_id.nil? && op.order.order_status_id = 1 && op.order.payment_order_status_id = 3
    end
  end

  task completed: :environment do
    order_products = OrderProduct.select do |op|
      !op.product_id.nil? && !op.batch_id.nil? && op.order.order_status_id = 2
    end

    filter_by_date = order_products.select do |o|
      o.batch.to >= DateTime.now.beginning_of_day && DateTime.now.end_of_day >= o.batch.to
    end

    filter_by_date.each do |order_product|
      order = Order.find(order_product.order_id)
      order.order_status_id = 3
      next unless order.save!

      product = Product.find(order_product.product_id.to_i)
      product.quantity -= order_product.sub_total / order_product.product.price.to_i
      product.save!
    end
  end
end
