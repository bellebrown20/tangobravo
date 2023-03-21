class InquiriesController < ApplicationController
  before_action :set_airplane, only: %i[new create]

  def index
    @inquiries = []
    Inquiry.all.each do |inquiry|
      @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @message = Message.new
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @inquiry = Inquiry.new
  end

  def create
    if user.role == "pilot"
      @inquiries = Inquiry.where(user == current_user)
    else
      @inquiries = Inquiry.where(airplane.user == current_user)
    end
    @inquiry = Inquiry.new
    @inquiry.airplane = @airplane
    @inquiry.user = current_user
    if @inquiry.save
      redirect_to airplane_path(@airplane)
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:airplane_id])
  end
end
