Rails.application.routes.draw do

  # portfolios routes
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # custom pages routes
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # blogs routes (blogs use freindly routes gem)
  resources :blogs

  # root
  root to: 'pages#home'
end
