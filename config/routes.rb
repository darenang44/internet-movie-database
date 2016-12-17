Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root 'movies#index'
end

# Prefix Verb   URI Pattern                Controller#Action
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PATCH  /movies/:id(.:format)      movies#update
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy
#       root GET    /                          movies#index

# Prefix Verb   URI Pattern                    Controller#Action
# new_user_session         GET    /users/sign_in(.:format)       devise/sessions#new
# user_session             POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session     DELETE /users/sign_out(.:format)      devise/sessions#destroy
# user_password            POST   /users/password(.:format)      devise/passwords#create
# new_user_password        GET    /users/password/new(.:format)  devise/passwords#new
# edit_user_password       GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
# user_registration        POST   /users(.:format)               devise/registrations#create
# new_user_registration    GET    /users/sign_up(.:format)       devise/registrations#new
# edit_user_registration   GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
