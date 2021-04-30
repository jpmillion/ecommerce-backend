class ApplicationController < ActionController::API
    def jwt_key
        Rails.application.credentials.jwt_key
    end

    def issue_token(customer)
        JWT.encode({customer_id: customer.id}, jwt_key, 'HS256')
    end

    def decoded_token(token)
        begin
          JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
          [{error: "Invalid Token"}]
        end
    end
    
end
