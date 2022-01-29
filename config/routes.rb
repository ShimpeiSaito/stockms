Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  root "top#index"


  resources :users, only: [:show, :create]

  resource :session, only: [:create, :destroy]
  resource :account, except: [:destroy]
  resource :password, only: [:show, :edit, :update]

  resources :items do
    get "search", on: :collection
  end
end
