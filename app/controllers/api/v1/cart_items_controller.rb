class Api::V1::CartItemsController < ApplicationController
    def create
        cart = Cart.find_by(id: params[:cart_id])
        cart_item = cart.cart_items.build(cart_items_params)
        if cart_item.save
            cart.update_total
            options = { include: [:cart] }
            render json: CartItemSerializer.new(cart_item, options)
        else
            render json: {errrors: cart_item.errors.full_messages}
        end
    end

    def update
        cart_item = CartItem.find_by(id: params[:id])
        cart_item.update(quantity: params[:quantity])
        cart_item.cart.update_total
        options = { include: [:cart] }
        render json: CartItemSerializer.new(cart_item, options)
    end

    def destroy
        cart = Cart.find_by(id: params[:cart_id])
        cart_item = CartItem.find_by(id: params[:id])
        cart_item.destroy
        cart.update_total
        render json: CartSerializer.new(cart)
    end

    private

    def cart_items_params
        params.require(:cart_item).permit(:quantity, :price, :title, :description, :image)
    end
end
