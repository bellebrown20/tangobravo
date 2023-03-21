class InquiryChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    inquiry = Inquiry.find(params[:id])
    stream_for inquiry
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
