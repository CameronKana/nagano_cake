Rails.application.routes.draw do
scope module: :public do
  get 'customers/edit', to: 'customers#edit'
  patch 'customers' , to: 'customers#update'

  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'

  # get  '/customers/unsubscribe' => 'customers#unsubscribe'
  # patch  '/customers/withdraw' => 'customers#withdraw'

end
# 顧客用
# URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  sessions: "public/sessions",
  registrations: "public/registrations",
}

root to: "public/homes#top"
    get '/about', to: 'public/homes#about', as: 'about'

  scope module: :public do
    get 'customers/my_page', to: 'customers#show'
    # get 'customers/edit', to: 'customers#edit'
    get 'customers/unsubscribe', to:'customers#unsubscribe'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'orders/confirm', to: 'orders#confirm'
    get 'orders/thanks', to: 'orders#thanks'
    # resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :items, only: [:index, :show]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
    resources :orders, only: [:new, :index, :show, :create]
    resources :registrations, only: [:new, :create]

  end


# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
    get 'admin/new', to: 'admin#new'

# root 'admin_login#new'
  namespace :admin do
    # get '/admin', to: redirect('/admin/genres')
    root to: "homes#top"
    # get 'homes/top', to: 'admin'
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :homes, only: [:top]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]

  end


# resources :public, only: [:show, :edit]

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end


