class Public::ReviewsController < ApplicationController
before_action :authenticate_user!

  def create
    @park = Park.find(params[:park_id])
    review = current_member.reviews.new(park_review_params)
    review.park_id = @park.id
    review.save
    redirect_to park_path(@park)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_back(fallback_location: park_path)
  end

 private
  def park_review_params
   params.require(:review).permit(:review_detail, :title)
  end

end
