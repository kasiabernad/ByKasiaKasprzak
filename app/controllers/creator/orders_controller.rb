class Creator::OrdersController < Creator::CreatorController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_items = @order.order_items
  end
  
  # def change_order_status order
  #   @current_order_status = current_order.order_status
  #   new_order_status_id = @current_order_status.id.to_i + 1
  #   return new_order_status_id
  # end

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
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to creator_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: creator_order_path(@order) }
      else
        format.html { render :new }
        format.json { render json: creator_order_path(@order).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to creator_orders_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: creator_order_path(@order) }
      else
        format.html { render :edit }
        format.json { render json: creator_order_path(@order).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to creator_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:bracelet_id, :price, :order_status_id)
    end
end
