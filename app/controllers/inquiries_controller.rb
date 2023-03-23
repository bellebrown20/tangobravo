class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.where(user: current_user).joins(:airplane).or(Inquiry.joins(:airplane).where(airplane: { user: current_user }))
    # @inquiries = []
    # Inquiry.all.each do |inquiry|
    #   @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    # end
  end

  def show
    @inquiries = Inquiry.where(user: current_user).joins(:airplane).or(Inquiry.joins(:airplane).where(airplane: { user: current_user })).joins(:last_message).order('messages.created_at ASC')
    @inquiry = Inquiry.find(params[:id])
    @inquiry.user = current_user
    @message = Message.new
  end

  # def new
  #   @airplane = Airplane.find(params[:airplane_id])
  #   @inquiry = Inquiry.new
  #   # @message = Message.new(inquiry: @inquiry, user: current_user, content: "I'm interested in this plane")
  # end

  def create
    @airplane = Airplane.find(params[:airplane_id])
    @inquiry = Inquiry.new
    @inquiry.airplane = @airplane
    @inquiry.user = current_user
    # raise
    @message = Message.new(inquiry: @inquiry, user: current_user, content: "I'm interested in this plane")
    @message.save
    if @inquiry.save
      redirect_to inquiry_path(@inquiry)
    else
      render "airplanes/show", status: :unprocessable_entity
    end
  end


  def edit
    @inquiry = Inquiry.find(params[:id])
    @airplane = @inquiry.airplane
    @user = current_user
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @airplane = @inquiry.airplane
    @inquiry.update(inquiry_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to inquiry_path(@inquiry)
  end

  private

  # def set_airplane
  #   @airplane = Airplane.find(params[:airplane_id])
  # end

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def inquiry_params
    params.require(:inquiry).permit(:status)
  end
end
