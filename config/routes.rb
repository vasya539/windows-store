Rails.application.routes.draw do
  namespace :account do
    resources :news
    resources :our_works
    resources :feedbacks, only: [:index, :show, :destroy]

    root to: 'dashboard#index'
  end

  resources :feedbacks, only: [:create]

  root to: 'home#index'
end
