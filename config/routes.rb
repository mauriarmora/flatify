Rails.application.routes.draw do
  devise_for :users

  resources :flats, except: [:index] do
    resources :expenses, except: [:index]
  end

  resources :expenses, only: [] do
    resources :comments
  end

  get '/:id/profile', to: 'profiles#show'
  get '/user_expenses', to: 'profile#expenses'
  get '/monthly_summary', to: 'profile#summary'
end
