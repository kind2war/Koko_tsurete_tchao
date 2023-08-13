class Public::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]


  def show
    @park = Park.find(params[:id])
    @review_comment = ReviewComment.new
    @review = Review.new
    @reviews = @park.reviews.all
    @member = current_member
  end

  def index
    @parks = @q.result
  end

  def search
    @results = @q.result
  end

  #csvインポートフォーム用
  def import
    Park.import(params[:file])
    redirect_to parks_url
  end

private
  def set_q
    @q = Park.ransack(params[:q])
  end
end
