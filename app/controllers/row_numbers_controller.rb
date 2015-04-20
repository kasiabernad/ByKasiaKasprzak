class RowNumbersController < ApplicationController
  before_action :set_row_number, only: [:show, :edit, :update, :destroy]

  # GET /row_numbers
  # GET /row_numbers.json
  def index
    @row_numbers = RowNumber.all
  end

  # GET /row_numbers/1
  # GET /row_numbers/1.json
  def show
  end

  # GET /row_numbers/new
  def new
    @row_number = RowNumber.new
  end

  # GET /row_numbers/1/edit
  def edit
  end

  # POST /row_numbers
  # POST /row_numbers.json
  def create
    @row_number = RowNumber.new(row_number_params)

    respond_to do |format|
      if @row_number.save
        format.html { redirect_to @row_number, notice: 'Row number was successfully created.' }
        format.json { render :show, status: :created, location: @row_number }
      else
        format.html { render :new }
        format.json { render json: @row_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /row_numbers/1
  # PATCH/PUT /row_numbers/1.json
  def update
    respond_to do |format|
      if @row_number.update(row_number_params)
        format.html { redirect_to @row_number, notice: 'Row number was successfully updated.' }
        format.json { render :show, status: :ok, location: @row_number }
      else
        format.html { render :edit }
        format.json { render json: @row_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /row_numbers/1
  # DELETE /row_numbers/1.json
  def destroy
    @row_number.destroy
    respond_to do |format|
      format.html { redirect_to row_numbers_url, notice: 'Row number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_row_number
      @row_number = RowNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def row_number_params
      params.require(:row_number).permit(:row_number)
    end
end
