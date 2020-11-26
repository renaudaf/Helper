class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    review.helper = User.find(params[:user_id])
    review.reviewer = current_user
    authorize review
    if review.save
      redirect_to user_path(review.helper)
    else
      render "users/show"
    end
  end

  def destroy
    review = Review.find(params[:id])
    authorize review
    review.destroy
    redirect_to user_path(review.helper)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
end
