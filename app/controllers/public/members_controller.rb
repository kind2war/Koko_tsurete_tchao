class Public::MembersController < ApplicationController
  before_action :ensure_guest_member, only: [:edit]

  def new
    @member = Member.new
  end

  def mypage
    @member = current_member
    @reviews = Review.where(member_id: @member.id)
  end

  def ensure_guest_user
    @member = Member.find(params[:id])
    if @member.guest_member?
      redirect_to member_path(current_member) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end

