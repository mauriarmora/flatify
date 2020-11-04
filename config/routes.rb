Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/en/dashboard', to: 'flats#show'
  resources :flats, except: [:index, :show] do
    resources :expenses, except: [:index]
  end

  resources :expenses, only: [] do
    resources :comments
  end

  get '/profile', to: 'profiles#show'

  get '/fetch_mate', to: 'flats#fetch_mate'
end
