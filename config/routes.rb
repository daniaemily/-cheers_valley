Rails.application.routes.draw do
  get 'pages/home'


  #keep below it is entire app!!
  devise_for :users
  root to: 'pages#home'
  # root to: 'wineries#index'

  resources :wineries do
    collection do
      get :autocomplete
    end
  end
  #only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
