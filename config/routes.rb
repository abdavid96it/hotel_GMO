Rails.application.routes.draw do

  namespace :fronts do
    get 'template/show'
  end


  authenticated :user do
    root "admins/template#index"
  end
  root 'fronts/template#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
