class Admin::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def new
    @park = Park.new
  end

  def create
    @park = Park.create(park_params)
    if @park.save
      redirect_to admin_park_path(@park)
    else
      @parks = Park.all
      render admin_parks_path
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id]).update(park_params)
    redirect_to admin_parks_path
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
    params.require(:park).permit(:park_name, :address,:park_type, :latitude, :longitude,  feature_ids: [], images:[])
  end

end