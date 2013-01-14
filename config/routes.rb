Comingsoon::Application.routes.draw do

  devise_for :users

  root :to => 'main#index'

  get "results" => 'main#results'
  get "single_result" => 'main#single_view'

  get "main/autocomplete" => 'main#autocomplete_movie_data_name'

  resources :reminders, :only => [:index, :create, :destroy]

end
