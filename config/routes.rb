Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

    get '/' => 'users#index'
    post '/create' => 'users#create'
    post '/login' => 'users#login'
    get '/show' => 'users#show'
    get '/info/:id' =>'users#detail'
    get '/edit/:id' =>'users#edit'
    post '/update/:id'=> 'users#update'
    post '/logout' => 'users#logout'
    get '/events' => 'events#index'
    post '/events/create' => 'events#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
