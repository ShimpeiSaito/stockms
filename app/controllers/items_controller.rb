class ItemsController < ApplicationController
    before_action :login_required

    def index
        @user = current_member
        @items = Item.where(user: @user).order(category: :desc).order(:name)
            .page(params[:page]).per(30)
      end
    
      def search
        @user = current_member
        @items = Item.where(user: @user).order(category: :desc).order(:name).search(params[:q])
            .page(params[:page]).per(30)
        render "index"
      end
    
      def show
        @item = Item.find(params[:id])
        if @item.user = current_member
            render "show"
        else 
            redirect_to :items
        end
      end
    
      def new
        @item = Item.new()
      end
    
      def create
        @item = Item.new(item_params)
        @item.user = current_member
        if @item.save
          redirect_to @item, notice: "アイテムを追加しました。"
        else
          render "new"
        end
      end
    
      def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to :items, notice: "アイテムを削除しました"
      end

      def edit
        @item = Item.find(params[:id])
      end
    
      def update
        @item = Item.new(item_params)
        @item.assign_attributes(item_params)
        @item.user = current_member
        if @item.save
          redirect_to @item, notice: "在庫情報を更新しました。"
        else
          render "edit"
        end
      end
    
      # ストロング・パラメータ
      private def item_params
        params.require(:item).permit(
          :name,
          :amount,
          :minimum,
          :category,
          :remarks
        )
      end
end
