class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new
    @survey.flight_type = params[:flight_type]
    @survey.car_share = params[:car_share]
    @survey.user_id = params[:user_id]
    @survey.flight_miles = params[:flight_miles]
    @survey.car_type = params[:car_type]
    @survey.car_miles = params[:car_miles]
    @survey.diet = params[:diet]

    if @survey.save
      redirect_to "/footprint", :notice => "Survey created successfully."
    else
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])

    @survey.flight_type = params[:flight_type]
    @survey.car_share = params[:car_share]
    @survey.user_id = params[:user_id]
    @survey.flight_miles = params[:flight_miles]
    @survey.car_type = params[:car_type]
    @survey.car_miles = params[:car_miles]
    @survey.diet = params[:diet]

    if @survey.save
      redirect_to "/surveys", :notice => "Survey updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])

    @survey.destroy

    redirect_to "/surveys", :notice => "Survey deleted."
  end
end
