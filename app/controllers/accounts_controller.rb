class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create]

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(account_params)
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def new
    @member = User.new()
  end

  def create
    @member = User.new(account_params)
    if @member.save
      redirect_to :root, notice: "会員登録が完了しました。"
      cookies.signed[:user_id] = { value: @member.id, expires: 20.minutes.from_now }
    else
      render "new"
    end
  end

  # ストロング・パラメータ
  private def account_params
    params.require(:account).permit(
      :login_id,
      :password,
      :name
    )
  end
end
