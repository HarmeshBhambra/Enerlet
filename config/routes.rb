Rails.application.routes.draw do

  devise_for :users

# Routes for the Home resource
get "/", :controller => "home", :action => "index"

# Routes for the About resource
get "/aboutus", :controller => "about", :action => "index"

# Routes for the Profiles resource
get "/profile", :controller => "profiles", :action => "index"

# Routes for the Footprints resource
get "/footprint", :controller => "footprints", :action => "index"

# Routes for the Actions resource
get "/action", :controller => "actions", :action => "index"

# Routes for the Trips resource
get "/trip", :controller => "trips", :action => "index"

get "/trip/map", :controller => "trips", :action => "map"

get "/trip/google_map", :controller => "trips", :action => "google_map"

end
