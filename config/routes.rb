# == Route Map
#
#     Prefix Verb   URI Pattern                         Controller#Action
#       root GET    /                                   pages#home
#      users GET    /users(.:format)                    users#index
#            POST   /users(.:format)                    users#create
#   new_user GET    /users/new(.:format)                users#new
#  edit_user GET    /users/:id/edit(.:format)           users#edit
#       user GET    /users/:id(.:format)                users#show
#            PATCH  /users/:id(.:format)                users#update
#            PUT    /users/:id(.:format)                users#update
#            DELETE /users/:id(.:format)                users#destroy
#    stories GET    /stories(.:format)                  stories#index
#            POST   /stories(.:format)                  stories#create
#  new_story GET    /stories/new(.:format)              stories#new
# edit_story GET    /stories/:id/edit(.:format)         stories#edit
#      story GET    /stories/:id(.:format)              stories#show
#            PATCH  /stories/:id(.:format)              stories#update
#            PUT    /stories/:id(.:format)              stories#update
#            DELETE /stories/:id(.:format)              stories#destroy
#       like GET    /stories/:id/like/:whisky(.:format) likes#like
#     unlike GET    /stories/:id/unlike(.:format)       likes#unlike
#      login GET    /login(.:format)                    session#new
#            POST   /login(.:format)                    session#create
#            DELETE /login(.:format)                    session#destroy
#

Rails.application.routes.draw do
    root :to => 'pages#home'


    get 'users/edit' =>'users#edit', :as =>'edit_user'  # you can not edit others' profile
    resources :users, :except =>[:edit]   #route generator

    resources :stories
    get '/user/:id/stories/' => 'stoies#index', :as =>'user_stories'


    # get '/stories/:id/like/:whisky' => 'likes#like', as: :like   # shall be post request,but because Post can only post forms to server, use get here
    # get '/stories/:id/unlike' => 'likes#unlike', as: :unlike    # shall be post request


    get '/stories/:id/like/:whisky' => 'stories#like', as: :like   # shall be post request,but because Post can only post forms to server, use get here
    get '/stories/:id/unlike' => 'stories#unlike', as: :unlike    # shall be post request

    get '/login' => 'session#new'
    post '/login' => 'session#create'
    delete '/login' => 'session#destroy'

end
