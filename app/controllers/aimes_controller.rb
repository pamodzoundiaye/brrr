class AimesController < ApplicationController
  before_action :set_aime, only: [:show, :edit, :update, :destroy]

  # GET /aimes
  # GET /aimes.json
  def index
    @aimes = Aime.all
  end

  # GET /aimes/1
  # GET /aimes/1.json
  def show
  end

  # GET /aimes/new
  def new
    @aime = Aime.new
  end

  # GET /aimes/1/edit
  def edit
  end

  # POST /aimes
  # POST /aimes.json
  def create
    @aime = Aime.new(aime_params)

    respond_to do |format|
      if @aime.save
        format.html { redirect_to @aime, notice: 'Aime was successfully created.' }
        format.json { render :show, status: :created, location: @aime }
      else
        format.html { render :new }
        format.json { render json: @aime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aimes/1
  # PATCH/PUT /aimes/1.json
  def update
    respond_to do |format|
      if @aime.update(aime_params)
        format.html { redirect_to @aime, notice: 'Aime was successfully updated.' }
        format.json { render :show, status: :ok, location: @aime }
      else
        format.html { render :edit }
        format.json { render json: @aime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aimes/1
  # DELETE /aimes/1.json
  def destroy
    @aime.destroy
    respond_to do |format|
      format.html { redirect_to aimes_url, notice: 'Aime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aime
      @aime = Aime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aime_params
      params.require(:aime).permit(:liker, :liked)
    end
end
