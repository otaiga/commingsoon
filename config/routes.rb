Comingsoon::Application.routes.draw do

  root :to => 'main#index'

  get "results" => 'main#results'

end
