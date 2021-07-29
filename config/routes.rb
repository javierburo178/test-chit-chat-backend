Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  post "/links" => 'links#create'
  get "/:short_url" => 'links#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
