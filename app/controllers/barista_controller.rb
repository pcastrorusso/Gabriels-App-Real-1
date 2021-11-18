class BaristaController < ApplicationController
  before_action :set_baristum, only: %i[ show edit update destroy ]

  # GET /barista or /barista.json
  def index
    @barista = Barista.all
  end

  # GET /barista/1 or /barista/1.json
  def show
  end

  # GET /barista/new
  def new
    @barista = Barista.new
  end

  # GET /barista/1/edit
  def edit
  end

  # POST /barista or /barista.json
  def create
    @barista = Barista.new(barista_params)

    respond_to do |format|
      if @barista.save
        format.html { redirect_to @barista, notice: "Barista was successfully created." }
        format.json { render :show, status: :created, location: @barista }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barista/1 or /barista/1.json
  def update
    respond_to do |format|
      if @barista.update(barista_params)
        format.html { redirect_to @barista, notice: "Barista was successfully updated." }
        format.json { render :show, status: :ok, location: @barista }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barista/1 or /barista/1.json
  def destroy
    @baristum.destroy
    respond_to do |format|
      format.html { redirect_to barista_url, notice: "Barista was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barista
      @barista = Barista.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barista_params
      params.require(:baristum).permit(:first_name, :last_name, :emails, :phone, :twitter)
    end
end
