class Api::V1::SessionsController < ApplicationController
    def create
        customer = Customer.find_by(email: params[:email])
        if customer && customer.authenticate(params[:password])
            token = issue_token(customer)
            render json: { customer: CustomerSerializer.new(customer), token: token }
        else
            render json: {errors: customer.errors.full_messages}
        end
    end

end
