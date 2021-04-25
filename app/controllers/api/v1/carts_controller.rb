class Api::V1::CartsController < ApplicationController
    def update
        cart = Cart.find_by(id: params[:id])
        cart.cart_items.destroy_all
        cart.update(total: 0)
        render json: 'Order Success'
    end
end
