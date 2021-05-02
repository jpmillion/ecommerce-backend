class Api::V1::SessionsController < ApplicationController
    def create
        customer = Customer.find_by(email: params[:email])
        if customer && customer.authenticate(params[:password_digest])
            token = issue_token(customer)
            render json: { customer: CustomerSerializer.new(customer), token: token, logIn: true }
        else
            render json: { errors: 'Invalid email or password', logIn: false, token: '' }
        end
    end

end
