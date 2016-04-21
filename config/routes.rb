Rails.application.routes.draw do

  # Routes for the Image resource:
  # CREATE
  get "/images/new", :controller => "images", :action => "new"
  post "/create_image", :controller => "images", :action => "create"

  # READ
  get "/images", :controller => "images", :action => "index"
  get "/images/:id", :controller => "images", :action => "show"

  # UPDATE
  get "/images/:id/edit", :controller => "images", :action => "edit"
  post "/update_image/:id", :controller => "images", :action => "update"

  # DELETE
  get "/delete_image/:id", :controller => "images", :action => "destroy"
  #------------------------------

  # Routes for the Survey resource:
  # CREATE
  get "/surveys/new", :controller => "surveys", :action => "new"
  post "/create_survey", :controller => "surveys", :action => "create"

  # READ
  get "/surveys", :controller => "surveys", :action => "index"
  get "/surveys/:id", :controller => "surveys", :action => "show"

  # UPDATE
  get "/surveys/:id/edit", :controller => "surveys", :action => "edit"
  post "/update_survey/:id", :controller => "surveys", :action => "update"

  # DELETE
  get "/delete_survey/:id", :controller => "surveys", :action => "destroy"
  #------------------------------

  get 'sessions/create'

  get 'sessions/destroy'

  devise_for :users, controllers: { registrations: "registrations" }

# Routes for the Home resource
get "/", :controller => "home", :action => "index"
get "/beta", :controller => "home", :action => "beta"

# Routes for the About resource
get "/aboutus", :controller => "about", :action => "index"

# Routes for the Lifestyles resource
get "/lifestyle", :controller => "lifestyles", :action => "index"

# Routes for the Footprints resource
get "/footprint", :controller => "footprints", :action => "index"

# Routes for the Actions resource
get "/action", :controller => "actions", :action => "index"

# Routes for the Trips resource
get "/trip", :controller => "trips", :action => "index"

get "/trip/map", :controller => "trips", :action => "map"

get "/trip/google_map", :controller => "trips", :action => "google_map"

# Routes for the Stripe Charges resource
resources :charges
end
