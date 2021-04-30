Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :carts, only: [:update] do
        resources :cart_items, except: [:new, :edit]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create] do
        resources :orders, only: [:create, :index]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :orders, only: [:index] do
        resources :order_items, only: [:create, :index]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create] do
        get 'authenticate', on: :collection
      end
    end
  end
end
