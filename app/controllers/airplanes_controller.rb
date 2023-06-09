class AirplanesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_airplane, only: %i[show edit update destroy]

  def index

    if params[:query].present?
      @airplanes = policy_scope(Airplane.search_by_make_and_engines(params[:query]))
      if params[:sort] == "review_average"
        @planes = Airplane.order(review_average: :desc)
        @airplanes = @planes.search_by_make_and_engines(params[:query])

      elsif params[:sort] == "price"
        @planes = Airplane.order(price_per_hour: :asc)
        @airplanes = @planes.search_by_make_and_engines(params[:query])
      end
    else
      @airplanes = policy_scope(Airplane.all)
      if params[:sort] == "review_average"
        @airplanes = Airplane.order(review_average: :desc)
      elsif params[:sort] == "price"
        @airplanes = Airplane.order(price_per_hour: :asc)
      end
    end

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
    @airplanes = policy_scope(current_user.airplanes)
  end

  def show
    authorize @airplane
    # @review = Review.new(list: @list)
    #@inquiries = Inquiry.where(user: current_user).joins(:airplane).or(Inquiry.joins(:airplane).where(airplane: { user: current_user })).joins(:last_message).order('messages.created_at ASC').uniq
    @review = Review.new(airplane: @airplane)
    @inquiry = Inquiry.new(airplane: @airplane)
  end

  def new
    @airplane = Airplane.new
    authorize @airplane
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.user = current_user
    @airplane.photos.attach(params[:airplane][:photos])
    authorize @airplane
    if @airplane.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to airplane_path(@airplane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @airplane

  end

  def update
    authorize @airplane
    @airplane = Airplane.find(params[:id])

    # Attach any new photos that were uploaded
    if params[:airplane][:photos].present?
      @airplane.photos.attach(params[:airplane][:photos])
    end

    # Remove any photos that were deselected
    if params[:airplane][:photos_fields].present?
      @airplane.photos.where(id: params[:airplane][:photos_fields].keys.map{|x| x if params[:airplane][:photos_fields][x] == "0"}).purge
    else
      @airplane.photos.purge
    end

    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @airplane
    @airplane.destroy
    # No need for app/views/airplanes/destroy.html.erb
    redirect_to airplanes_path, status: :see_other
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:make, :engines, :tailnumber, :minimum_hours, :required_licenses, :home_airport, :address, :description, :price_per_hour)
  end
end
