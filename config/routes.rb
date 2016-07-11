# == Route Map
#
#     Prefix Verb   URI Pattern                 Controller#Action
#       root GET    /                           pages#home
#      users GET    /users(.:format)            users#index
#            POST   /users(.:format)            users#create
#   new_user GET    /users/new(.:format)        users#new
#  edit_user GET    /users/:id/edit(.:format)   users#edit
#       user GET    /users/:id(.:format)        users#show
#            PATCH  /users/:id(.:format)        users#update
#            PUT    /users/:id(.:format)        users#update
#            DELETE /users/:id(.:format)        users#destroy
#    stories GET    /stories(.:format)          stories#index
#            POST   /stories(.:format)          stories#create
#  new_story GET    /stories/new(.:format)      stories#new
# edit_story GET    /stories/:id/edit(.:format) stories#edit
#      story GET    /stories/:id(.:format)      stories#show
#            PATCH  /stories/:id(.:format)      stories#update
#            PUT    /stories/:id(.:format)      stories#update
#            DELETE /stories/:id(.:format)      stories#destroy
#      likes GET    /likes(.:format)            likes#index
#            POST   /likes(.:format)            likes#create
#   new_like GET    /likes/new(.:format)        likes#new
#  edit_like GET    /likes/:id/edit(.:format)   likes#edit
#       like GET    /likes/:id(.:format)        likes#show
#            PATCH  /likes/:id(.:format)        likes#update
#            PUT    /likes/:id(.:format)        likes#update
#            DELETE /likes/:id(.:format)        likes#destroy
#      login GET    /login(.:format)            session#new
#            POST   /login(.:format)            session#create
#            DELETE /login(.:format)            session#destroy
#

Rails.application.routes.draw do
    root :to => 'pages#home'

    resources :users

    resources :stories


    get '/stories/:id/like/:whisky' => 'stories#like', as: :like
    get '/stories/:id/unlike' => 'stories#unlike', as: :unlike

    get '/login' => 'session#new'
    post '/login' => 'session#create'
    delete '/login' => 'session#destroy'

end
