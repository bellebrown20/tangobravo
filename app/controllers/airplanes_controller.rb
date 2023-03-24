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
    # @review = Review.new(list: @list)
    @review = Review.new(airplane: @airplane)
    @inquiry = Inquiry.new(airplane: @airplane)
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
    @airplane = Airplane.find(params[:id])

    # Remove any photos that were deselected
    if params[:airplane][:photos].present?
      @airplane.photos.where.not(id: params[:airplane][:photos]).purge
    else
      @airplane.photos.purge
    end

    # Attach any new photos that were uploaded
    @airplane.photos.attach(params[:airplane][:photos]) if params[:airplane][:photos].present?

    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit, status: :unprocessable_entity
    end
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
    params.require(:airplane).permit(:make, :engines, :tailnumber, :minimum_hours, :required_licenses, :home_airport, :address, :description, :price_per_hour, photos: [], photo_ids: [])
  end
end
