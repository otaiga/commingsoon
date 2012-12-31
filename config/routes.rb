Comingsoon::Application.routes.draw do

  devise_for :users

  root :to => 'main#index'

  get "results" => 'main#results'
  get "film_info" => 'main#film_info'

  resources :reminders, :only => :create

end
