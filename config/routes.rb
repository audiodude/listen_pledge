Listenpledge::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get '/sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
    get '/register', :to => 'users#register', :as => :new_user_registration
    post '/register', :to => 'users#submit_registration'
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :users do
    collection do
      get 'pairing'
    end
    member do
      post 'set_email'
    end
  end

  resources :songs do
    collection do
      get 'import' => 'songs#start_import', :as => 'start_import'
      post 'import'
    end
  end

  resources :pairings, :only => [:comment] do
    member do
      post 'comment'
    end
  end

  match 'intro' => 'home#intro', :as => :intro
  root :to => "home#index"
end
