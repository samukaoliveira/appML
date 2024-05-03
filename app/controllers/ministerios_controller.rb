class MinisteriosController < ApplicationController
  before_action :set_ministerio, only: %i[ show edit update destroy ]

  # GET /ministerios or /ministerios.json
  def index
    @ministerios = Ministerio.all
  end

  # GET /ministerios/1 or /ministerios/1.json
  def show
  end

  # GET /ministerios/new
  def new
    @ministerio = Ministerio.new
  end

  # GET /ministerios/1/edit
  def edit
  end

  # POST /ministerios or /ministerios.json
  def create
    @ministerio = Ministerio.new(ministerio_params)

    respond_to do |format|
      if @ministerio.save
        format.html { redirect_to ministerio_url(@ministerio), notice: "Ministerio was successfully created." }
        format.json { render :show, status: :created, location: @ministerio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ministerios/1 or /ministerios/1.json
  def update
    respond_to do |format|
      if @ministerio.update(ministerio_params)
        format.html { redirect_to ministerio_url(@ministerio), notice: "Ministerio was successfully updated." }
        format.json { render :show, status: :ok, location: @ministerio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministerios/1 or /ministerios/1.json
  def destroy
    @ministerio.destroy!

    respond_to do |format|
      format.html { redirect_to ministerios_url, notice: "Ministerio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ministerio
      @ministerio = Ministerio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ministerio_params
      params.require(:ministerio).permit(:lider, :nome, :administrador)
    end
end
