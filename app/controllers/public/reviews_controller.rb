class Public::ReviewsController < ApplicationController
before_action :authenticate_member!

  def create
    park = Park.find(params[:park_id])
    review = current_member.reviews.new(review_params)
    review.park_id = park.id
    if park.valid? && review.valid?
      # 両方のモデルがバリデーションをパスした場合の処理
      park.save
      review.save
      redirect_to park_path(park), notice: "投稿しました"
    else
      # バリデーションエラーがある場合の処理
      flash[:alert] = "入力に不備があります"
      @park = Park.find(params[:park_id])
      @review = current_member.reviews.new(review_params)
      review.park_id = park.id
      render template: "/public/parks/show"
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to park_path(params[:park_id]), notice: "レビューを削除しました"
  end

 private
  def review_params
    params.require(:review).permit(:title, :review_detail, :park_id)
  end


end
