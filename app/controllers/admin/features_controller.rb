class Admin::FeaturesController < ApplicationController
	before_action :authenticate_admin!

	def create
		@feature = Feature.new(feature_params)
		@features = Feature.all
		@feature.save
	end

	def index
		@features = Feature.all
		@feature = Feature.new
	end

	def destroy
		@features = Feature.all
		@feature = Feature.find(params[:id])
		@feature.destroy
	end

private
	def feature_params
		params.require(:feature).permit(:feature_detail)
	end

end
