class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :lookup, except: [:new]
 
  def new
    @item = Sale.find(params[:sale_id]).items.new
    respond_to do |format|
      format.html
      format.json { render :json => @item }
    end
  end

  def create
    @item = @sale.items.create item_params
    respond_to do |format|
      if @item.save
        format.html { redirect_to @sale }
        format.json { render :json => @item, status: :created, :location => 'nil' }
      else
        format.html
        format.json { render :json => @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.items.where(id: params[:id])[0].destroy!
    respond_to do |format|
      if Item.all.where(id: params[:id])[0] == nil
        format.html { redirect_to '/' }
        format.json { render :json => @sale, status: :no_content }
      end
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
