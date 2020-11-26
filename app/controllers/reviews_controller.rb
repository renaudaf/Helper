class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    review.helper = User.find(params[:user_id])
    review.reviewer = current_user
    if review.save
      redirect_to user_path(review.helper)
    else
      
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
end
