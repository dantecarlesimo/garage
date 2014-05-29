class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    item_id = params[:id]
    sale_id = params[:sale_id]
    sale = Sale.find_by_id(sale_id)

    transaction = nil
    if sale
      item = sale.items.find_by_id(item_id)
      if item
        if sale.user_id != current_user.id
          seller_id = sale.user_id
          transaction = Transaction.new(user_id: current_user.id, seller_id: seller_id, item_id: item_id)
        end
      end
    end

    if transaction && transaction.save
      item.transaction_id = transaction.id
      if item.save
        flash[:sucess] = "item purchased"
        #sidekiq emailer
        redirect_to "/sales/#{sale_id}"
      else
        flash[:error] = "transaction failed"
        redirect_to sale
      end 
    else
      flash[:error] = "transaction failed"
      redirect_to sales_path
    end
  end
end