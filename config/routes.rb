Rails.application.routes.draw do
  resources :comments
  resources :aimes
  resources :eyes
  resources :vues
  resources :demandes
  resources :locations
  resources :towns
  root 'places#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :places do
    get :like
    get :dislike
    get :save_comments
  end 
  get 'ventes', to: 'places#ventes'
  get 'rents', to: 'places#locations'
  get 'auberge', to: 'places#auberge'
  get 'shared', to: 'places#shared'
  get 'guide', to: 'places#guide'
  get 'courtiers', to: 'places#courtiers'
  get 'shop', to: 'places#shop'
  get 'pubs', to: 'places#pubs'
  get 'admin', to: 'places#admin'
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
