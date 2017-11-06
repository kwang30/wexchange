Rails.application.routes.draw do
  root 'home#home'
  get     '/',                        to: 'home#home'

  controller :users do
    get     '/profile/addPic',         to: 'users#addPic'
    patch    '/profile/addPic',         to: 'users#update'
    get     '/signup',                  to: 'users#new'
    get     '/',                 to: 'users#show'
    post    '/profile',                 to: 'users#update'
  end

  controller :sessions do
    get     '/login',                   to: 'sessions#new'
    post    '/login',                   to: 'sessions#create'
    delete  '/logout',                  to: 'sessions#destroy'
    delete  '/profile',                  to: 'sessions#destroy'
  end

  controller :notifications do
    get     '/notifications',           to: 'notifications#notifications'
    get     '/notifications/home',           to: 'notifications#home'

  end

  controller :settings do
    get     '/profile/edit',            to: 'settings#edit_user'
    get     '/settings',                to: 'settings#index'
    get     '/settings/profile',        to: 'settings#edit_user'
    get     '/settings/billing',        to: 'settings#edit_billing'
    get     '/settings/advanced',       to: 'settings#edit_advanced'
    get     '/settings/notifications',  to: 'settings#edit_notifications'
  end

  controller :portfolios do
    get     '/addPhoto',             to: 'portfolios#addPhoto'
    post    '/addPhoto' ,            to: 'portfolios#upload_images'
    post    '/portfolios',           to: 'portfolios#create'
    get     '/portfolios/edit',      to: 'portfolios#edit'
    delete  '/portfolios/delete',     to: 'portfolios#delete'
  end

  controller :transactions do
    get      '/transactions',         to: 'transactions#index'
    get      '/transactions',         to: 'transactions#new'
    post     '/transactions/create',         to: 'transactions#create'
  end

  controller :discover do
    get     '/discover',                to: 'discover#show'
  end

  controller :requests do
    get '/requests',   to: 'requests#index'
  end

  controller :chats do
    get '/chats', to: 'chats#index'
  end

  resources :users do
    resources :reviews
  end

  resources :charges
  resources :transactions
  resources :portfolios
  resources :photos
  resources :chats, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
end
