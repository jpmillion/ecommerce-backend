class Api::V1::OrdersController < ApplicationController
    def create
        customer = Customer.find_by(id: params[:customer_id])
        order = customer.orders.create(order_params)
        params[:order_items].each do |order_item|
            order.order_items.create(price: order_item[:price], title: order_item[:title], description: order_item[:description], quantity: order_item[:quantity], image: order_item[:image])
        end 
        render json: OrderSerializer.new(order)
    end

    private

    def order_params
        params.require(:order).permit(:total)
    end
end
