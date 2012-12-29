Comingsoon::Application.routes.draw do

  root :to => 'main#index'

  get "results" => 'main#results'
  get "film_info" => 'main#film_info'

end
