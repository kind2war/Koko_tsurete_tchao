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
    review = Review.find(params[:id])
    if review.member == current_member
      review.destroy
      redirect_to park_path(params[:park_id]), notice: "レビューを削除しました。"
    else
      redirect_to park_path(params[:park_id]), alert: "レビューは削除できません。"
    end
  end

 private
  def review_params
    params.require(:review).permit(:title, :review_detail, :park_id)
  end


end
