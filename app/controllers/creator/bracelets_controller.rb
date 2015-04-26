class Creator::BraceletsController < Creator::CreatorController
  before_action :set_bracelet, only: [:show, :edit, :update, :destroy]
  before_action :set_current_color, only: [:pallete, :edit, :change]
  before_action :set_color_position, only: [:change]
  # GET /bracelets
  # GET /bracelets.json
  
  
  def index
    @bracelets = Bracelet.where(user_id: current_user.id)
  end

  # GET /bracelets/1
  # GET /bracelets/1.json
  def show
  end

  # GET /bracelets/new
  def new
    @bracelet = Bracelet.new
  end

  def pallete
    @colors = Color.available
  end

  def change
    @color_position.color = @current_color
    @color_position.save!
  end

  # GET /bracelets/1/edit
  def edit
    @colors = Color.available
  end

  # POST /bracelets
  # POST /bracelets.json
  def create
    params[:bracelet][:user_id]= current_user.id   
    @bracelet = Bracelet.new(bracelet_params)
    respond_to do |format|
      if @bracelet.save
        format.html { redirect_to edit_creator_bracelet_path(@bracelet), notice: 'Bracelet was successfully created.' }
        format.json { render :edit, status: :created, location: creator_bracelet_path(@bracelet) }
      else
        format.html { render :new }
        format.json { render json: creator_bracelet_path(@bracelet).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bracelets/1
  # PATCH/PUT /bracelets/1.json
  def update
    respond_to do |format|
      if @bracelet.update(bracelet_params)
        format.html { redirect_to creator_bracelet_path(@bracelet), notice: 'Bracelet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bracelet }
      else
        format.html { render :edit }
        format.json { render json: creator_bracelet_path(@bracelet).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bracelets/1
  # DELETE /bracelets/1.json
  def destroy
    @bracelet.destroy
    respond_to do |format|
      format.html { redirect_to creator_bracelets_url, notice: 'Bracelet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_color_position
      @color_position = ColorPosition.find(params[:position_id])
    end

    def set_current_color
      @current_color = Color.find_by_hex(params[:current_color].upcase) if params[:current_color]
      
      if !@current_color
          @current_color = Color.first
      end

    end

    def set_bracelet
      @bracelet = Bracelet.includes(:color_positions).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracelet_params
      params.require(:bracelet).permit(:clasp, :casp, :color_position_id, :row_count, :price, :height, :user_id)
    end
end
