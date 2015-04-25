class Admin::ColorPositionsController < Admin::AdminController
  before_action :set_color_position, only: [:show, :edit, :update, :destroy]
  
  # GET /color_positions
  # GET /color_positions.json
  def index
    @color_positions = ColorPosition.all
  end

  # GET /color_positions/1
  # GET /color_positions/1.json
  def show
  end

  # GET /color_positions/new
  def new
    @color_position = ColorPosition.new
  end

  # GET /color_positions/1/edit
  def edit
  end

  # POST /color_positions
  # POST /color_positions.json
  def create
    @color_position = ColorPosition.new(color_position_params)

    respond_to do |format|
      if @color_position.save
        format.html { redirect_to @color_position, notice: 'Color position was successfully created.' }
        format.json { render :show, status: :created, location: @color_position }
      else
        format.html { render :new }
        format.json { render json: @color_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_positions/1
  # PATCH/PUT /color_positions/1.json
  def update
    respond_to do |format|
      if @color_position.update(color_position_params)
        format.html { redirect_to @color_position, notice: 'Color position was successfully updated.' }
        format.json { render :show, status: :ok, location: @color_position }
      else
        format.html { render :edit }
        format.json { render json: @color_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_positions/1
  # DELETE /color_positions/1.json
  def destroy
    @color_position.destroy
    respond_to do |format|
      format.html { redirect_to color_positions_url, notice: 'Color position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_position
      @color_position = ColorPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_position_params
      params.require(:color_position).permit(:color_id, :position)
    end
end
