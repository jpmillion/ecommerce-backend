class ApplicationController < ActionController::API
    def jwt_key
        Rails.application.credentials.jwt_key
    end

    def issue_token(customer)
        JWT.encode({customer_id: customer.id}, jwt_key, 'HS256')
    end

    def decoded_token
        begin
          JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
          [{error: "Invalid Token"}]
        end
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
 
    def token
        request.headers['Authorization']
    end
     
    def customer_id
        decoded_token.first['customer_id']
    end
     
    def current_customer
        customer ||= Customer.find_by(id: customer_id)
    end
     
    def logged_in?
        !!current_customer
    end
end
