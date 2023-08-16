class Admin::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def new
    @park = Park.new
  end

  def create
    @park = Park.create(park_params)
    @park.save
    redirect_to admin_parks_path
  end

  def edit
    @park = Park.find(params[:id]) # DBから既存のものを取得
  end

  def update
    Park.find(params[:id]).update(park_params)
  end

  def index
    @park = Park.new
    @parks = @q.result
  end

  def search
    @results = @q.result
  end

  def import
    Park.import(params[:file])
    redirect_to admin_parks_path
  end

private
  def set_q
    @q = Park.ransack(params[:q])
  end

  def park_params
    params.require(:park).permit(:park_name, :address,:park_type, :latitude, :longitude,  feature_id: [], images:[])
  end

end