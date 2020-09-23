Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#show'

  resources :flats, except: [:index, :show] do
    resources :expenses, except: [:index]
  end

  resources :expenses, only: [] do
    resources :comments
  end

  get '/profile', to: 'profiles#show'
  get '/user_expenses', to: 'profiles#expenses'
  get '/monthly_summary', to: 'profiles#summary'
end
