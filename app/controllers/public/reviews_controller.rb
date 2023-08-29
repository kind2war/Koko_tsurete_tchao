class Public::ReviewsController < ApplicationController
before_action :authenticate_member!

  def create
    park = Park.find(params[:park_id])
    review = current_member.reviews.new(review_params)
    review.park_id = park.id
    review.save
    redirect_to park_path(park)
  end

  def destroy
    review = Review.find(params[:id])
    
    review.destroy
    redirect_to park_path(params[:park_id])
  end

 private
  def review_params
    params.require(:review).permit(:title, :review_detail, :park_id)
  end

end
