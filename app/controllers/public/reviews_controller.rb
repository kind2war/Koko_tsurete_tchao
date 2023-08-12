class Public::ReviewsController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    review = current_member.reviews.new(park_review_params)
    review.park_id = @park.id
    review.save
    redirect_to park_path(@park)
  end

  def destroy
    @review = Review.find(params[:id])
    @park = @review.park # レビューに関連するパークを取得
    @review.destroy
    redirect_to park_path(@park)
  end

 private
  def park_review_params
   params.require(:review).permit(:review_detail, :title)
  end

end
