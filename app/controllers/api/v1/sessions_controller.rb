class Api::V1::SessionsController < ApplicationController
    def create
        customer = Customer.find_by(email: params[:email])
        if customer #&& customer.authenticate(password: params[:password])
            render json: CustomerSerializer.new(customer)
        else
            render json: {errors: customer.errors.full_messages}
        end
    end
end
