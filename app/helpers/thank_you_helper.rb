module ThankYouHelper
  def calculate_total
    sub_total        = food_info.price + 2
    discount_percent = customer_info.coupon == 'PRATEEK' ? 50 : 0
    {
        :sub_total        => sub_total,
        :discount_percent => discount_percent,
        :total            => sub_total - (sub_total.to_i / 100 * discount_percent)
    }
  end

  def customer_info
    Order.find(params[:order_id])
  end

  def food_info
    FoodItem.find(params[:food_id])
  end
end