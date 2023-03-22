class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.where(user: current_user).joins(:airplane).or(Inquiry.joins(:airplane).where(airplane: { user: current_user }))
    # @inquiries = []
    # Inquiry.all.each do |inquiry|
    #   @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    # end
  end

  def show
    # chatboxes = Chatbox.joins(:messages).group('chatboxes.id').order('MAX(messages.created_at) DESC')
    @inquiries = Inquiry.where(user: current_user).joins(:airplane).or(Inquiry.joins(:airplane).where(airplane: { user: current_user })).joins(:last_message).order('messages.created_at ASC')
    # .order('messages.created_at DESC')
    # @inquiries = @inquiries.order(message.created_at: :desc)
    # .order('MAX(messages.created_at) DESC')
    # Inquiry.all.each do |inquiry|
    #   @inquiries << inquiry if inquiry.user == current_user || inquiry.airplane.user == current_user
    # end
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
