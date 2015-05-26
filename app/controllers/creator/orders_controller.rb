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
    @user = @order.user
  end
  
  def edit_shipping_address
    @user = User.find(params[:user_id])
  end
  def show_shipping_address
    @user = User.find(params[:user_id])
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
    
    @order.bracelets.each do |b|
      if b.draft == true
        b.update(draft:false)
        b.save!
      end
    end
    
    if @order == current_order
      if current_order.order_status_id > 1
        session[:order_id] = nil
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
      params.require(:order).permit(:price, :subtotal, :tax, :shipping, :total, :order_status_id, :user_id, user_attributes:[:shipping_street_address, :shipping_zip, :shipping_city])
    end
end
