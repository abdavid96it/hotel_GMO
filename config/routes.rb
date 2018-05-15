Rails.application.routes.draw do
    root 'fronts/template#index'
  namespace :fronts do
    get 'template/show'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
