class TripsController < ApplicationController

before_action :authenticate_user!

def plan_journey
end

def google_map
end

def map

  # Origin
  @origin = params[:origin].to_s
  @url_safe_origin = URI.encode(@origin)

  url_origin = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_origin}"

  parsed_data_origin = JSON.parse(open(url_origin).read)

  @lat_origin = parsed_data_origin["results"][0]["geometry"]["location"]["lat"].to_f

  @lng_origin = parsed_data_origin["results"][0]["geometry"]["location"]["lng"].to_f

  # Destination
  @destination = params[:destination].to_s
  @url_safe_destination = URI.encode(@destination)

  url_destination = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_destination}"

  parsed_data_destination = JSON.parse(open(url_destination).read)

  @lat_destination = parsed_data_destination["results"][0]["geometry"]["location"]["lat"].to_f

  @lng_destination = parsed_data_destination["results"][0]["geometry"]["location"]["lng"].to_f

  #Google Maps Transit
  url_transit = "https://maps.googleapis.com/maps/api/directions/json?origin=#{@url_safe_origin}&destination=#{@url_safe_destination}&mode=transit"

  parsed_data_transit = JSON.parse(open(url_transit).read)

  @distance_transit = parsed_data_transit["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_transit = @distance_transit.gsub(/[^0-9]/,'').delete('mi').to_f**0.19

  @duration_transit = parsed_data_transit["routes"][0]["legs"][0]["duration"]["text"]

  #Google Maps Driving
  url_driving = "https://maps.googleapis.com/maps/api/directions/json?origin=#{@url_safe_origin}&destination=#{@url_safe_destination}&mode=driving"

  parsed_data_driving = JSON.parse(open(url_driving).read)

  @distance_driving = parsed_data_driving["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_driving = @distance_driving.gsub(/[^0-9]/,'').delete('mi').to_f**0.9042

  @duration_driving = parsed_data_driving["routes"][0]["legs"][0]["duration"]["text"]

  #Google Maps Walking
  url_walking = "https://maps.googleapis.com/maps/api/directions/json?origin=#{@url_safe_origin}&destination=#{@url_safe_destination}&mode=walking"

  parsed_data_walking = JSON.parse(open(url_walking).read)

  @distance_walking = parsed_data_walking["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_walking = @distance_walking.gsub(/[^0-9]/,'').delete('mi').to_f*0

  @duration_walking = parsed_data_walking["routes"][0]["legs"][0]["duration"]["text"]

  #Google Maps Bicycling
  url_bicycling = "https://maps.googleapis.com/maps/api/directions/json?origin=#{@url_safe_origin}&destination=#{@url_safe_destination}&mode=bicycling"

  parsed_data_bicycling = JSON.parse(open(url_bicycling).read)

  @distance_bicycling = parsed_data_bicycling["routes"][0]["legs"][0]["distance"]["text"]

  @carbon_bicycling = @distance_bicycling.gsub(/[^0-9]/,'').delete('mi').to_f*0

  @duration_bicycling = parsed_data_bicycling["routes"][0]["legs"][0]["duration"]["text"]

  #Google Maps Link
  @google_maps = "http://maps.google.com/maps?saddr=#{@url_safe_origin}&daddr=#{@url_safe_destination}"

end
end
