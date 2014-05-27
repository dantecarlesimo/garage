class SalesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :lookup, only: [:edit, :update, :destroy]

  respond_to :json

  def index
    @sales = Sale.all
    respond_to do |format|
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
    respond_with @sale
  end

  def create
    @sale = Sale.create sale_params
    if @sale.save
      respond_with @sale, status: :created
    else
      respond_with @sale.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @sale.update sale_params
    if @sale.save
      respond_with @sale, notice: "sucessful update."
    else
      respond_with @sale.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @sale.destroy
    respond_with status: :no_content
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
