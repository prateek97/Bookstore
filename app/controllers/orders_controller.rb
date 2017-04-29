class OrdersController < ApplicationController
  def new
    @food_item = FoodItem.find params[:food_item_id]
  end

  def create
    @food_item = FoodItem.find params[:food_item_id]

    @order           = Order.new(order_params)
    @order.food_item = @food_item

    if @order.save
      redirect_to thank_you_path(:food_id => @food_item.id, :order_id => @order.id)
      flash[:success] = 'We received your order. Thank you!'
    else

      flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
      render 'new'
    end
  end
def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    flash[:notice] = "It is removed from your order"
    redirect_to order_path
  end
  private
  def order_params
    params.require(:order).permit(:name, :phone, :address, :coupon)
  end
end
