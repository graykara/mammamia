Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  namespace 'admin' do
    resources :users
    resources :contracts
    resources :devices
    resources :device_wares
    resources :device_codes
  end

  match '/admin/device/:contract_id/list' => 'admin/devices#list',        as: :device_lists,        via: :get
  match '/admin/device/:contract_id/list' => 'admin/devices#update_list', as: :device_lists_update, via: :put
end
