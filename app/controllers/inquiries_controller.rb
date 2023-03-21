class InquiriesController < ApplicationController

  def index
    @inquiries = []
    Inquiry.all.each do |inquiry|
      @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    end
  end

  def show
    @inquiries = []
    Inquiry.all.each do |inquiry|
      @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    end
    @inquiry = Inquiry.find(params[:id])
    @message = Message.new
  end

  def new
    @airplane = Airplane.find(params[:airplane_id])
    @inquiry = Inquiry.new
    # authorize @reservation
  end

  def create
    @airplane = Airplane.find(params[:airplane_id])
    @inquiry = Inquiry.new
    @inquiry.airplane = @airplane
    @inquiry.user = current_user
    if @inquiry.save
      redirect_to airplane_path(@airplane)
    else
      render "airplanes/show", status: :unprocessable_entity
    end
  end

  private

  # def set_airplane
  #   @airplane = Airplane.find(params[:airplane_id])
  # end

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end
end
