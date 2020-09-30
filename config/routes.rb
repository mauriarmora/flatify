Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard', to: 'flats#show'
  resources :flats, except: [:index, :show] do
    resources :expenses, except: [:index]
  end

  resources :expenses, only: [] do
    resources :comments
  end

  get '/profile', to: 'profiles#show'
  get '/summary', to: 'profiles#summary'

  get '/fetch_mate', to: 'flats#fetch_mate'
end
