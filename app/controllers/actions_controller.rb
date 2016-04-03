class ActionsController < ApplicationController

def plan_journey

@street_address = "98 Teg Down Meads Winchester, UK"
url_safe_street_address = URI.encode(@street_address)

url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"

parsed_data = JSON.parse(open(url).read)

@lat = parsed_data["results"][0]["geometry"]["location"]["lat"]

@lng = parsed_data["results"][0]["geometry"]["location"]["lng"]

render("plan_journey.html.erb")

end

end
