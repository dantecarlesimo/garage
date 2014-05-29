class SalesController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :lookup, only: [:edit, :show, :update, :destroy]

  def index
    @sales = Sale.all
    respond_to do |format|
      format.html
      format.json { render :json => { sales: @sales.as_json(include: :items) }, status: :ok } # if transaction_id == nil (?)
    end
    
    # respond_to do |format|
    #   @sales.each do |sale|
    #     items = sale.items.where(transaction_id: nil)
    #     format.json { render json: {"sales" => sale.as_json(include: (items: items.as_json) }, status: :ok } # if transaction_id == nil (?)
    #   end
    # end
  end

  def new
    @sale = Sale.new
    respond_to do |format|
      format.html
      format.json { render :json => @sale }
    end
  end

  def create
    @sale = Sale.new sale_params
    @sale.user_id = current_user.id
    respond_to do |format|
      if @sale.save
        format.html { redirect_to '/sales/' } # redirect user to ? after garage sale create
        format.json { render :json => @sale , status: :created }
      else
        format.html { redirect_to '/sales/new' }
        format.json { render :json => @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit
  end

  def update
    @sale.update sale_params
    respond_to do |format|
      if @sale.save
        format.html 
        format.json { render :json => @sale, notice: "sucessful update." }
      else
        format.html
        format.json { render :json => @sale.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to '/'} # redirect user to ? after garage sale destroy
      format.json { render :json => @sale, status: :no_content }
    end
  end

  # rescue_from ActionController::ParameterMissing, :only => :create do |err|
  #   respond_to do |format|
  #     format.json {render :json  => {:error => err.message}, :status => 422}
  #   end
  # end

private
  def lookup
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:address, :city, :zipcode, :date, :time_start, :time_end, :title, :description, :photo)
  end
end
