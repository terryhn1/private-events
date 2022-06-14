Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :events do
    member do
      patch :create_attendee
    end
  end

  resources :event_lists
  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
