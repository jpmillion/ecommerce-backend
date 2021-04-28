class Api::V1::CustomersController < ApplicationController
    # def create
    #     customer = Customer.new(customer_params)
    #     if customer.save
    #         render json: CustomerSerializer.new(customer)
    #     else
    #         render json: {errors: customer.errors.full_messages}
    #     end
    # end

    # private

    # def customer_params
    #     params.require(:customer).permit(:email, :first_name, :last_name, :password)
    # end

    def create
        customer = Customer.new(customer_params)
        if customer.save
            token = issue_token(customer)
            options = {include: [:cart, :cart_items, :order, :order_items]}
            render json: { customer: CustomerSerializer.new(customer, options), jwt: token }
        else
            render json: { error: customer.errors.full_messages }, status: :not_acceptable
        end
    end

    private 

    def customer_params
        params.require(:customer).permit(:email, :password_digest, :first_name)
    end
end
