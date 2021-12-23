Rails.application.routes.draw do
  # Devise

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

scope module: :public do

  resource :customers, only: [:show]
  get "customers/profile_edit" => "customers#edit"
  patch "customers/profile_edit" => "customers#update"
  resources :orders, only: [:create, :new, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  patch "addresses" => "addresses#update"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]

  # Top aboutページ
  root "homes#top"
  get "home/about" => "homes#about"
  # customer
  get "unsubscribe" => "customers#unsubscribe"
  patch "withdraw" => "customers#withdraw"
  # cart_items
  delete "destroy_all" => "cart_items#destroy_all"

  # orders
  get "complete" => "orders#complete"
  post "confirm" => "orders#confirm"

  end

# Admin側

namespace :admin do

  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:index, :show, :edit, :new, :create, :update]
  resources :orders, only: [:index, :show, :update]
  resources :genres, only: [:index, :edit, :create, :update]
  resources :order_details, only: [:update]


  end


end
