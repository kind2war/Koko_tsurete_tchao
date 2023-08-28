class Admin::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_admin!

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to park_path(@park)
    else
      @parks = Park.all
      redirect_to admin_parks_path
    end
  end

  def show
    @park = Park.find(params[:id])
    @reviews = Review.all
    @review = Review.new
    @member = Member.all
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id]).update(park_params)
    redirect_to park_path(params[:id])
  end

  def destroy
    Park.find(params[:id]).destroy
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
    redirect_to parks_path
  end

private
  def set_q
    @q = Park.ransack(params[:q])
  end

  def park_params
    params.require(:park).permit(:park_name, :address,:park_type, :latitude, :longitude, :area, :size, :size_rank,  feature_ids: [], images:[])
  end

end