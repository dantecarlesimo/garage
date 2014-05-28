class PagesController < ApplicationController
   before_action :authenticate_user!, except: [:index]
#   before_action :lookup, only: [:edit, :update, :destroy]

  def index

  end

  def user_sales
    @user_sales = current_user.sales
  end

  def user_items
    @user_sales = current_user.sales
  end

  def user_transactions
    @user_transactions = Transaction.where(seller_id:current_user)
  end


end
