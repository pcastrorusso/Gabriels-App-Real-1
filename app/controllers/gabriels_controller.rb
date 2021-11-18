class GabrielsController < ApplicationController
  before_action :set_gabriel, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [ :edit, :update, :destroy]

  # GET /gabriels or /gabriels.json
  def index
    @gabriels = Gabriel.all
  end

  # GET /gabriels/1 or /gabriels/1.json
  def show
  end

  # GET /gabriels/new
  def new
    @gabriel = current_user.gabriels.build

  end

  # GET /gabriels/1/edit
  def edit
  end

  # POST /gabriels or /gabriels.json
  def create
   #@gabriel = Gabriel.new(gabriel_params)
    @gabriel = current_user.gabriels.build (gabriel_params)
    respond_to do |format|
      if @gabriel.save
        format.html { redirect_to @gabriel, notice: "Gabriel was successfully created." }
        format.json { render :show, status: :created, location: @gabriel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gabriel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gabriels/1 or /gabriels/1.json
  def update
    respond_to do |format|
      if @gabriel.update(gabriel_params)
        format.html { redirect_to @gabriel, notice: "Gabriel was successfully updated." }
        format.json { render :show, status: :ok, location: @gabriel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gabriel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gabriels/1 or /gabriels/1.json
  def destroy
    @gabriel.destroy
    respond_to do |format|
      format.html { redirect_to gabriels_url, notice: "Gabriel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   def correct_user
    @gabriel = current_user.gabriels.find_by(id: params[:id])
    redirect_to gabriels_path, notice: "Not authorized to do this action..." if @gabriel.nil?
   end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gabriel
      @gabriel = Gabriel.find(params[:id])
    end

    def gabriel_params
      params.require(:gabriel).permit(:first_name, :last_name, :emails, :phone, :twitter, :user_id)
    end
end
