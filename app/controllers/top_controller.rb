class TopController < ApplicationController
  before_action :login_required

  def index
    @message = "Hello!"
    @user = current_member
    @items = Item.where(user: @user).where("amount <= minimum").order(category: :desc).order(:name)
        .page(params[:page]).per(30)
  end
end
