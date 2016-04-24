class FootprintsController < ApplicationController
def index
  @survey = Survey.find_by({:user_id => current_user.id})

  # Diet calculation

  @survey_diet = @survey.diet.to_s

  if @survey_diet == "Meat Lover"
    @diet_carbon = 7275
  elsif @survey_diet == "Average American"
    @diet_carbon = 5511
  elsif @survey_diet == "No Beef"
    @diet_carbon = 4189
  elsif @survey_diet == "Vegetarian"
    @diet_carbon = 3748
  elsif @survey_diet == "Vegan"
    @diet_carbon = 3307
  end

  # Car Type and Miles calculation

  @survey_car_type = @survey.car_type

  @survey_car_miles = @survey.car_miles

  if @survey_car_type == 0 && @survey_car_miles == 0
    @car_carbon = 0
  elsif @survey_car_type == 1 && @survey_car_miles == 0
    @car_carbon = 2866
  elsif @survey_car_type == 1 && @survey_car_miles == 1
    @car_carbon = 7275
  elsif @survey_car_type == 1 && @survey_car_miles == 2
    @car_carbon = 14771
  elsif @survey_car_type == 1 && @survey_car_miles == 3
     @car_carbon = 25251
  elsif @survey_car_type == 2 && @survey_car_miles == 0
    @car_carbon = 4409
  elsif @survey_car_type == 2 && @survey_car_miles == 1
    @car_carbon = 10803
  elsif @survey_car_type == 2 && @survey_car_miles == 2
    @car_carbon = 21605
  elsif @survey_car_type == 2 && @survey_car_miles == 3
    @car_carbon = 35274
  elsif @survey_car_type == 3 && @survey_car_miles == 0
    @car_carbon = 5071
  elsif @survey_car_type == 3 && @survey_car_miles == 1
    @car_carbon = 12346
  elsif @survey_car_type == 3 && @survey_car_miles == 2
    @car_carbon = 24251
  elsif @survey_car_type == 3 && @survey_car_miles == 3
    @car_carbon = 41887
  elsif @survey_car_type == 4 && @survey_car_miles == 0
    @car_carbon = 5732
  elsif @survey_car_type == 4 && @survey_car_miles == 1
    @car_carbon = 14550
  elsif @survey_car_type == 4 && @survey_car_miles == 2
    @car_carbon = 28660
  elsif @survey_car_type == 4 && @survey_car_miles == 3
    @car_carbon = 48501
  end

  # Car Share calculation

  @carbon_car_share = @car_carbon.to_f / @survey.car_share.to_f

  # Flight Miles calculation

  @survey_flight_miles = @survey.flight_miles

  if @survey_flight_miles == 0
    @flight_miles_carbon = 0
  elsif @survey_flight_miles == 1
    @flight_miles_carbon = 1
  elsif @survey_flight_miles == 2
    @flight_miles_carbon = 2
  elsif @survey_flight_miles == 3
    @flight_miles_carbon = 3
  elsif @survey_flight_miles == 4
    @flight_miles_carbon = 4
  end

  @carbon_transport = @flight_miles_carbon.to_f + @carbon_car_share.to_f

end

end
