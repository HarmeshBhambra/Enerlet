class ActionsController < ApplicationController

def plan_journey
end

def google_map
end

def map

  # Origin
  @origin = params[:origin].to_s
  url_safe_origin = URI.encode(@origin)

  # Destination
  @destination = params[:destination]
  url_safe_destination = URI.encode(@destination)

  #Google Maps Transit
  url_transit = "https://maps.googleapis.com/maps/api/directions/json?origin=#{url_safe_origin}&destination=#{url_safe_destination}&mode=transit"

  parsed_data_transit = JSON.parse(open(url_transit).read)

  @distance_transit = parsed_data_transit["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_transit = @distance_transit.to_f**0.19

  #Google Maps Driving
  url_driving = "https://maps.googleapis.com/maps/api/directions/json?origin=#{url_safe_origin}&destination=#{url_safe_destination}&mode=driving"

  parsed_data_driving = JSON.parse(open(url_driving).read)

  @distance_driving = parsed_data_driving["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_driving = @distance_driving.to_f**0.9042

  #Google Maps Walking
  url_walking = "https://maps.googleapis.com/maps/api/directions/json?origin=#{url_safe_origin}&destination=#{url_safe_destination}&mode=walking"

  parsed_data_walking = JSON.parse(open(url_walking).read)

  @distance_walking = parsed_data_walking["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_walking = @distance_walking.to_f*0

  #Google Maps Bicycling
  url_bicycling = "https://maps.googleapis.com/maps/api/directions/json?origin=#{url_safe_origin}&destination=#{url_safe_destination}&mode=bicycling"

  parsed_data_bicycling = JSON.parse(open(url_bicycling).read)

  @distance_bicycling = parsed_data_bicycling["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_bicycling = @distance_bicycling.to_f*0

end

end
