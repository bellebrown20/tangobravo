class AirplanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_airplane, only: %i[show edit update destroy]

  def index
    @airplanes = Airplane.all

    @markers = @airplanes.geocoded.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { airplane: airplane }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def my_airplanes
    @airplanes = current_user.airplanes
  end

  def show
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.user = current_user
    if @airplane.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to airplane_path(@airplane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @airplane.update(airplane_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to airplane_path(@airplane)
  end

  def destroy
    @airplane.destroy
    # No need for app/views/airplanes/destroy.html.erb
    redirect_to airplanes_path, status: :see_other
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:model, :class, :tailnumber, :minimum_hours, :requireed_licenses, :home_airport, photos: [])
  end
end
