Comingsoon::Application.routes.draw do

  devise_for :users

  root :to => 'main#index'

  get "results" => 'main#results'

  resources :reminders, :only => [:index, :create, :destroy]

end
