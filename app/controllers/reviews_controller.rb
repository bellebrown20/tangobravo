class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    authorize @review
    @airplane = Airplane.find(params[:airplane_id])
    @review.airplane = @airplane
    @review.user = current_user
    if @review.save
      @airplane.calculate_review_average
      redirect_to airplane_path(@airplane)
      flash[:alert] = "Review submitted"
    else
      render 'airplanes/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to airplane_path(@review.airplane)
  end

  private

  def review_params
    params.require(:review).permit(:content, :score)
  end
end
