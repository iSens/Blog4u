Blog4u::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts do
    resources :comments
  end
 
 root :to => 'posts#index'

end
