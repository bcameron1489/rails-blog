Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # portfolios routes
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # custom pages routes
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # blogs routes (blogs use freindly routes gem)
  resources :blogs do
    member do
      get :toggle_status
      end
    end

  # root
  root to: 'pages#home'
end
