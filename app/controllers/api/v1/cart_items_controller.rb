class Api::V1::CartItemsController < ApplicationController
    def create
        cart = Cart.find_by(id: params[:cart_id])
        cart_item = cart.cart_items.build(price: params[:price], quantity: params[:quantity])
        if cart_item.save
            cart.update_total(cart_item.price, cart_item.quantity)
            options = { include: [:cart] }
            render json: CartItemSerializer.new(cart_item, options)
        else
            render json: {errrors: cart_item.errors.full_messages}
        end
    end

    private

    def cart_items_params
        params.require(:cart_item).permit(:quantity, :price, :cart_id)
    end
end
