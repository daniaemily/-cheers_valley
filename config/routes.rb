Rails.application.routes.draw do
  devise_for :users
  root to: 'wineries#index'

  resources :wineries do
    collection do
      get :autocomplete
    end
  end
  #only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
