class Public::MembersController < ApplicationController
  def new
    @member = Member.new
  end

end

