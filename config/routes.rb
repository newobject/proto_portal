ProtoPortal::Application.routes.draw do
  devise_for :users

  match '/auth/proto/authorize' => 'auth#authorize'
  match '/auth/proto/access_token' => 'auth#access_token'
  match '/auth/proto/user' => 'auth#user'
  match '/oauth/token' => 'auth#access_token'

  namespace :admin do
    resources :apps
    resources :roles
    resources :users
    resources :user_app_roles
    resources :nav_nodes
    root :to => redirect('/admin/apps')
  end

  namespace :api do
    namespace :v1 do
      resources :apps
      resources :nav_nodes
    end
  end

  root :to => 'home#index'
end
