class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :add_food, :destroy]
  before_action :set_user, only: [:index, :new, :create, :add_food, :edit, :update, :destroy, :create_helper]
  before_action :set_food, only: [:add_food]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    create_helper
    respond_to do |format|
      if @order.save
        format.html { redirect_to "/users/#{@user.id}/orders/#{@order.id}", notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to "/users/#{@user.id}/orders/#{@order.id}", notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to "/users/#{@user.id}/orders", notice: 'Order was successfully Cancelled.' }
      format.json { head :no_content }
    end
  end

  def add_food
    @order.add_food(@food)
    redirect_back(fallback_location: @user_order)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_food
    @food = Food.find(params[:food_id])
  end

  def create_helper
    @order = Order.new(order_params)
    @user.orders << @order
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :date)
  end
end
