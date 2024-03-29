require 'url_constrainer'

Rails.application.routes.draw do
  root 'static_pages#home'

  get 'todoapp', to: 'static_pages#todoapp'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'confirm_email', to: 'users/registrations#confirm_email'
  end

  resources :users,               only: [:index] do
    collection do
      get :search
    end
  end

  resources :posts,               except: [:index], param: :url_token do
    resources :comments,          only: [:create, :destroy]
    collection do
      get :search
    end
  end

  resources :relationships,       only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]

  constraints(UrlConstrainer.new) do
    resources :users, param: :username, path: '/', only: [:show, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
