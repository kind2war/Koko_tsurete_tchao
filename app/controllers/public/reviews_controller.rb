class Public::ReviewsController < ApplicationController
before_action :authenticate_member!

  def create
    park = Park.find(params[:park_id])
    review = current_member.reviews.new(review_params)
    review.park_id = park.id
    if review.save
      redirect_to park_path(park), notice: "投稿しました"
    else
      render "new"
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to park_path(params[:park_id])
  end

 private
  def review_params
    params.require(:review).permit(:title, :review_detail, :park_id)
  end

end
