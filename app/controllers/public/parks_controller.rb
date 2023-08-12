class Public::ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @review_comment = ReviewComment.new
    @review = Review.new
    @reviews = @park.reviews.all
    @member = current_member
  end

  def index
    @parks = Park.all
  end

  #csvインポートフォーム用
  def import
    Park.import(params[:file])
    redirect_to parks_url
  end

end
