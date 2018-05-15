Rails.application.routes.draw do

  authenticated :user do
    root "admins/template#index"
  end
  root "home#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
