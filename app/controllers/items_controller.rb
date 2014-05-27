class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :lookup, except: [:new]
  
  respond_to :json

  def new
    @item = Sale.find(params[:sale_id]).items.new
    respond_with @item
  end

  def create
    @item = @sale.items.create item_params

    if @item.save
      respond_with @item, status: :created, :location => 'nil'
    else
      respond_with @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    #@item = Item.find(params[:id])
    @sale.items.where(id: params[:id])[0].destroy!
    if Item.all.where(id: params[:id])[0] == nil
      respond_with status: :no_content
    end
  end

private
  def lookup
    @sale = Sale.find(params[:sale_id])
  end
  
  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
