class Admin::ParksController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def create
  end

  def index
    @parks = @q.result
  end

  def search
    @results = @q.result
  end

  def import
    Park.import(params[:file])
    redirect_to parks_url
  end

private
  def set_q
    @q = Park.ransack(params[:q])
  end
end
