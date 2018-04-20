Rails.application.routes.draw do

  # portfolios routes
  resources :portfolios, except: [:show]
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
