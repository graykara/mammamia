Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  namespace 'admin' do
    resources :users
    resources :contracts
  end

end
