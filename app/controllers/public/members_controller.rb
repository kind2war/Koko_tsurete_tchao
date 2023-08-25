class Public::MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def mypage
    @member = current_member
    @reviews = Review.where(member_id: @member.id)
  end
end

