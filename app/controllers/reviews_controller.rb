class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @airplane = Airplane.find(params[:airplane_id])
    @review.airplane = @airplane
    @review.user = current_user
    if @review.save
      redirect_to airplane_path(@airplane)
    else
      redirect_to airplane_path(@airplane)
      # @bookmark = Bookmark.new
      # render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to airplane_path(@review.ariplane)
  end

  private

  def review_params
    params.require(:review).permit(:content, :score)
  end
end
