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

get "/action/plan_journey", :controller => "actions", :action => "plan_journey"

end
