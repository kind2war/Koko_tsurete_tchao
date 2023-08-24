class Public::HomesController < ApplicationController
	def top
		@reviews = Review.limit(5).order(created_at: :DESC)
		@parks = Park.where("park_type = '特殊公園（風致公園、動植物公園、歴史公園、墓園）'").sample(4)
	end

end
