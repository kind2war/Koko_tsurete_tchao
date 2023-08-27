class Public::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]


  def show
    @park = Park.find(params[:id])
    @review = Review.new
    #@review_comment = ReviewComment.new
    #@reviews = @park.reviews.all
    @member = current_member
  end

  def index
    @parks = @q.result(distinct: true)
  end

  def update
    @park = Park.find(params[:id]).update(park_params)
    redirect_to park_path(params[:id])
  end

  def search
    @results = @q.result
  end

  def search_tag
    @tag_list = Feature.all
    @tag = Feature.find(params[:feature_id])
    @parks = @tag.parks
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

  def park_params
    params.require(:park).permit(:park_name, :address,:park_type, :latitude, :longitude, :size_rank,  feature_ids: [], images:[])
  end


end
