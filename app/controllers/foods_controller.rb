class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy, :add_food]
  before_action :set_order, only: [:add_food, :order_index]
  before_action :set_user, only: [:add_food]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_food
    if current_user.balance >= @food.cost
      current_order.add_food(@food)
      new_balance = current_user.balance - @food.cost
      current_user.update_column(:balance, new_balance)
      redirect_to "/users/#{current_user.id}/orders/#{current_order.id}/add_food", notice: 'The food has been added to your order.'
    else
      redirect_to "/users/#{current_user.id}/orders/#{current_order.id}/add_food", notice: 'We could not add the food, as your balance is too low.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_params
    params.require(:food).permit(:name, :order_id, :cost, :description)
  end
end
