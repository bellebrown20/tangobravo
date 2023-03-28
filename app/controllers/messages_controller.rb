class MessagesController < ApplicationController

  def create
    @inquiry = Inquiry.find(params[:inquiry_id])
    @message = Message.new(message_params)
    @message.inquiry = @inquiry
    @message.user = current_user
    if @message.save
      InquiryChannel.broadcast_to(
        @inquiry,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "inquiries/show", status: :unprocessable_entity
    end
  end

  def update
      @message = Message.find(params[:id])
      @message.update(message_params)
      head :no_content
  end

  private

  def message_params
    params.require(:message).permit(:content, :read)
  end

end
